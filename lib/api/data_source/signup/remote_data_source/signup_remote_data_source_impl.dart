import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_executor.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/api/models/user_data/user_data_model.dart';
import 'package:movies_app/api/requests/request_mapper.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/data/data_source/signup/signup_data_source.dart';
import 'package:movies_app/domain/entities/requests/signup_request/signup_request_entity.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: SignupDataSource)
class SignupRemoteDataSourceImpl implements SignupDataSource {
  final FirebaseFirestore _firestore;
  final ApiExecutor _apiExecutor;

  const SignupRemoteDataSourceImpl(this._firestore, this._apiExecutor);

  @override
  Future<Result<void>> signupWithEmailAndPassword({
    required SignupRequestEntity request,
  }) async {
    return await _apiExecutor.executeApi(() async {
      final signupRequest = RequestMapper.toSignupModelRequest(
        request: request,
      );
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: signupRequest.email,
            password: signupRequest.password,
          );
      final userDataModel = UserDataModel(
        userId: userCredential.user?.uid,
        fullName: signupRequest.fullName,
        email: signupRequest.email,
        phoneNumber: signupRequest.phoneNumber,
        selectedImage: signupRequest.selectedImage,
        historyListIds: signupRequest.historyListIds,
        watchListIds: signupRequest.watchListIds,
      );
      await _firestore
          .collection(ConstKeys.users)
          .doc(userCredential.user?.uid)
          .set(userDataModel.toFireStore());
      MoviesMethodHelper.userData = userDataModel.toUserDataEntity();
    });
  }
}
