import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<User> googleLogin() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication _googleAuth =
      await _googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    idToken: _googleAuth.idToken,
    accessToken: _googleAuth.accessToken,
  );

  final result = await _auth.signInWithCredential(credential);
  print(result);

  return result.user;
}

Future<void> googleLogout() async {}
