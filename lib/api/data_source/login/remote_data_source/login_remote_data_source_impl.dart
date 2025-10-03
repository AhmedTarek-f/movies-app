import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/api/models/user_data/user_data_model.dart';
import 'package:movies_app/api/requests/request_mapper.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/data/data_source/login/remote_data_source/login_remote_data_source.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity/login_request_entity.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  }) async {
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async => await executeApi(() async {
        final loginRequest = RequestMapper.toLoginModelRequest(
          request: request,
        );
        final user = await auth.signInWithEmailAndPassword(
          email: loginRequest.email,
          password: loginRequest.password,
        );
        if (user.user != null) {
          final userDoc = await db
              .collection("Users")
              .doc(user.user?.uid)
              .get();
          MoviesMethodHelper.userData = UserDataModel.fromFireStore(
            userDoc,
          ).toUserDataEntity();
        }
      }),
    );
  }

  @override
  Future<Result<void>> loginWithGoogle() async {
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    late final UserCredential userCredential;
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async => await executeApi(() async {
        late final OAuthCredential credential;
        final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await userAccount?.authentication;

        try {
          credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
        } catch (e) {
          throw AppText.googleLoginCanceled;
        }
        userCredential = await auth.signInWithCredential(credential);
        final userData = UserDataModel(
          userId: userCredential.user?.uid,
          email: userCredential.user?.email,
          phoneNumber: userCredential.user?.phoneNumber,
          fullName: userCredential.user?.displayName,
          selectedImage: 4,
          watchListIds: [],
          historyListIds: [],
        );
        await db
            .collection("Users")
            .doc(userData.userId)
            .set(userData.toFireStore());
      }),
    );
  }
}
