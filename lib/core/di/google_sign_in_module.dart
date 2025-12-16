import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/constants/const_keys.dart';

@module
abstract class GoogleSignInModule {
  @preResolve
  Future<GoogleSignIn> googleSignIn() async {
    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(serverClientId: ConstKeys.serverClientId);

    return googleSignIn;
  }
}
