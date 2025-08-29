import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:samvad/models/user_model.dart';

class SignupService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      // 1. Create user in FirebaseAuth
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = cred.user!.uid;

      // 2. Create user model
      UserModel user = UserModel(user_id: uid, email_id: email);

      // 3. Save user to Firestore
      await _firestore.collection("users").doc(uid).set(user.toMap());

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw Exception(
          "This email ID is already registered. Please try logging in.",
        );
      } else if (e.code == "invalid-email") {
        throw Exception("Invalid email address. Please enter a valid email.");
      } else {
        throw Exception(e.message ?? "Signup failed. Please try again.");
      }
    }
  }
}