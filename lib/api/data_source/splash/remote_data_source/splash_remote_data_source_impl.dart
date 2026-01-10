import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_executor.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/api/models/user_data/user_data_model.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/data/data_source/splash/splash_data_source.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: SplashDataSource)
class SplashRemoteDataSourceImpl implements SplashDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final ApiExecutor _apiExecutor;

  const SplashRemoteDataSourceImpl(
    this._firestore,
    this._firebaseAuth,
    this._apiExecutor,
  );

  @override
  Future<Result<void>> getUserData() async {
    return await _apiExecutor.executeApi(() async {
      final response = await _firestore
          .collection(ConstKeys.users)
          .doc(_firebaseAuth.currentUser?.uid)
          .get();
      final userData = UserDataModel.fromFireStore(response).toUserDataEntity();
      MoviesMethodHelper.userData = userData;
    });
  }
}
