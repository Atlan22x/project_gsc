import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_gsc/screens/home.dart';
import 'package:project_gsc/screens/consultant_home.dart';
import 'package:project_gsc/screens/login.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/verify_consultant.dart';
import 'utils/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ConsuLawtion',
      home: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const VerifyConsultant();
          } else {
            return const LogIn();
          }
        },
      ),
    );
  }
}
