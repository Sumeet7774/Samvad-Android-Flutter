import 'package:firebase_auth/firebase_auth.dart';
import 'package:samvad/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // 1. Sign in with FirebaseAuth
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = cred.user!.uid;

      // 2. Fetch user details from Firestore
      DocumentSnapshot<Map<String, dynamic>> doc = await _firestore
          .collection("users")
          .doc(uid)
          .get();

      if (doc.exists) {
        return UserModel.fromMap(doc.data()!);
      } else {
        throw Exception("User record not found in database.");
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}
