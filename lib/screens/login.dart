import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/auth.dart';
import 'package:project_gsc/screens/register.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String? errorMessage = '';
  

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> logInWithEmailAndPassword() async {
    try {
      await Auth().logInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: Container()),

            // Application Name
            const Text(
              'App Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),

            // Spacing
            const SizedBox(
              height: 32,
            ),

            // Username
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              controller: _controllerEmail,
            ),

            // Spacing
            const SizedBox(
              height: 16,
            ),

            // Password
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              controller: _controllerPassword,
            ),

            //Spacing
            const SizedBox(
              height: 20,
            ),

            // Login Button
            InkWell(
              onTap: logInWithEmailAndPassword,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(color: Colors.white, spreadRadius: 2),
                  ],
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //Spacing
            const SizedBox(
              height: 32,
            ),

            // To Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Register.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Flexible(flex: 2, child: Container()),
          ],
        ),
      )),
    );
  }
}
