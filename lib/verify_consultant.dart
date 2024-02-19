import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_gsc/screens/consultant_home.dart';
import 'package:project_gsc/screens/home.dart';

class VerifyConsultant extends StatefulWidget {
  const VerifyConsultant({super.key});

  @override
  State<VerifyConsultant> createState() => _VeriftConsultantState();
}

class _VeriftConsultantState extends State<VerifyConsultant> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: db.collection("users").doc(currentUser!.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the future to complete, return a loading indicator or widget
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          // If an error occurred, display an error message
          return Text("Error: ${snapshot.error}");
        } else {
          // If the future has completed successfully
          final data = snapshot.data!.data() as Map<String, dynamic>;
          final isConsultant = data["isConsultant"] ?? false;

          if (isConsultant) {
            return const ConsultantHome();
          } else {
            return Home();
          }
        }
      },
    );
  }
}
