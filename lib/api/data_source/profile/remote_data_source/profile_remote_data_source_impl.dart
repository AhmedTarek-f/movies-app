import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/connection_manager/connection_manager.dart';
import 'package:movies_app/data/data_source/profile/profile_data_source.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@Injectable(as: ProfileDataSource)
final class ProfileRemoteDataSourceImpl implements ProfileDataSource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  const ProfileRemoteDataSourceImpl(this._auth, this._googleSignIn);

  @override
  Future<Result<void>> logout() async {
    return await ConnectionManager.userConnectionResult(
      apiDataSource: () async {
        await _auth.signOut();
        await _googleSignIn.signOut();
        MoviesMethodHelper.userData = null;
        return Success(successData: null);
      },
    );
  }
}
