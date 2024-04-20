//contains all functions related to auth
import 'package:firebase_auth/firebase_auth.dart';

//class contains functions related to firebase auth
class AuthService {
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        return 'The password you provided is too weak. Try again';
      } else if (e.code == 'email-already-in-use') {
        return 'An account already exists for this email';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for email provided';
      } else if (e.code == 'wrong-password') {
        return 'Incorrect password';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
