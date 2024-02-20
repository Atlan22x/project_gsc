import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_gsc/models/user.dart' as model;

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Normal User Login
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Normal User Create Account
  Future<void> createUserWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required bool isConsultant,
  }) async {
    UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    model.User user = model.User(
      uid: cred.user!.uid,
      username: username,
      photoUrl: '',
      email: email,
      phoneNumber: '',
      address: '',
      birthDate: '',
      isConsultant: isConsultant,
    );

    // Add user to the database
    await _firebaseFirestore
        .collection('users')
        .doc(cred.user!.uid)
        .set(user.toJson());
  }

  // Consultant Login
  Future<void> logInAsConsultantWithEmailAndPassword({
    required String email,
    required String password,
    required String srtNumber,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Logout
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

}
