import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_gsc/user.dart' as model;

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Get User Details
  Future<model.User> getUserDetails() async {
    User currentUser = _firebaseAuth.currentUser!;

    DocumentSnapshot snap =
        await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
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
    );

    // Add user to the database
        await _firebaseFirestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
