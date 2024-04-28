import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Create a new document for the user in the 'users' collection
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return 'Success';
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          return 'The password you provided is too weak. Try again';
        } else if (e.code == 'email-already-in-use') {
          return 'An account already exists for this email';
        } else {
          return e.message;
        }
      } else {
        return e.toString();
      }
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if the user document exists, if not, create one
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
      if (!userDoc.exists) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': email,
        });
      }

      return 'Success';
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          return 'No user found for email provided';
        } else if (e.code == 'wrong-password') {
          return 'Incorrect password';
        } else {
          return e.message;
        }
      } else {
        return e.toString();
      }
    }
  }
}

