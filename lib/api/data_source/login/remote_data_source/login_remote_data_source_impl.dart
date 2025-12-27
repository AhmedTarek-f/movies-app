import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/api/models/user_data/user_data_model.dart';
import 'package:movies_app/api/requests/request_mapper.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/data/data_source/login/login_data_source.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity/login_request_entity.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: LoginDataSource)
class LoginRemoteDataSourceImpl implements LoginDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  const LoginRemoteDataSourceImpl(
    this._auth,
    this._firestore,
    this._googleSignIn,
  );

  @override
  Future<Result<void>> loginWithEmailAndPassword({
    required LoginRequestEntity request,
  }) async {
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async {
        final loginRequest = RequestMapper.toLoginModelRequest(
          request: request,
        );
        final user = await _auth.signInWithEmailAndPassword(
          email: loginRequest.email,
          password: loginRequest.password,
        );
        if (user.user != null) {
          final userDoc = await _firestore
              .collection(ConstKeys.users)
              .doc(user.user?.uid)
              .get();
          MoviesMethodHelper.userData = UserDataModel.fromFireStore(
            userDoc,
          ).toUserDataEntity();
        }
        return Success(successData: null);
      },
    );
  }

  @override
  Future<Result<void>> loginWithGoogle() async {
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async {
        final GoogleSignInAccount googleUser = await _googleSignIn
            .authenticate();
        final idToken = googleUser.authentication.idToken;
        final authorizationClient = googleUser.authorizationClient;
        final GoogleSignInClientAuthorization? authorization =
            await authorizationClient.authorizationForScopes([
              ConstKeys.email,
              ConstKeys.profile,
            ]);
        final accessToken = authorization?.accessToken;
        final credential = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(credential);
        final bool isNewUser =
            userCredential.additionalUserInfo?.isNewUser ?? false;
        if (isNewUser) {
          final User? user = userCredential.user;
          final userData = UserDataModel(
            userId: user?.uid,
            email: user?.email,
            phoneNumber: user?.phoneNumber,
            fullName: user?.displayName,
            selectedImage: 4,
            watchListIds: [],
            historyListIds: [],
          );
          await _firestore
              .collection(ConstKeys.users)
              .doc(userData.userId)
              .set(userData.toFireStore());
          MoviesMethodHelper.userData = userData.toUserDataEntity();
        } else {
          final userDoc = await _firestore
              .collection(ConstKeys.users)
              .doc(userCredential.user?.uid)
              .get();
          MoviesMethodHelper.userData = UserDataModel.fromFireStore(
            userDoc,
          ).toUserDataEntity();
        }
        return Success(successData: null);
      },
    );
  }
}
