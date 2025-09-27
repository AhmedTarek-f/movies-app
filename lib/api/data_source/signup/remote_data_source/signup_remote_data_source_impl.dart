import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/api/models/user_data/user_data_model.dart';
import 'package:movies_app/api/requests/request_mapper.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/exceptions/firebase_exceptions.dart';
import 'package:movies_app/core/exceptions/response_exception.dart';
import 'package:movies_app/data/data_source/signup/remote_data_source/signup_remote_data_source.dart';
import 'package:movies_app/domain/entities/requests/signup_request/signup_request_entity.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: SignupRemoteDataSource)
class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  @override
  Future<Result<void>> signupWithEmailAndPassword({
    required SignupRequestEntity request,
  }) async {
    try {
      final db = FirebaseFirestore.instance;
      final bool connection = await ConnectionManager.checkConnection();
      if (connection) {
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
        await db
            .collection("Users")
            .doc(userCredential.user?.uid)
            .set(userDataModel.toFireStore());
        MoviesMethodHelper.userData = userDataModel.toUserDataEntity();
        return Success<void>(successData: null);
      } else {
        return Failure(
          responseException: const ResponseException(
            message: AppText.connectionError,
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      return Failure(
        responseException: FirebaseExceptions.firebaseAuth(
          error,
        ).responseException,
      );
    } on FirebaseException catch (error) {
      return Failure(
        responseException: FirebaseExceptions.firebaseExceptions(
          error,
        ).responseException,
      );
    } catch (error) {
      return Failure(
        responseException: ResponseException(
          message: "${AppText.unknownErrorMessage} ${error.toString()}",
        ),
      );
    }
  }
}
