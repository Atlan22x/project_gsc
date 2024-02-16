import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/auth.dart';
import 'package:project_gsc/screens/login.dart';
import 'package:project_gsc/screens/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();

  // User create account function
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        username: _controllerUsername.text,
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showSnackBar(e.message, context);
    }
  }

  // Error message
  showSnackBar(String? content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content!),
      ),
    );
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
              'Nama Aplikasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),

            // Spacing
            const SizedBox(
              height: 32,
            ),

            // Email
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              controller: _controllerUsername,
            ),

            // Spacing
            const SizedBox(
              height: 12,
            ),

            // Email
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
              height: 12,
            ),

            // Password
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Kata Sandi',
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

            // Login or Register Button
            InkWell(
              onTap: createUserWithEmailAndPassword,
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
                  'Buat Akun',
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
                    "Sudah ada akun? ",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LogIn()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Masuk Akun",
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
