import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/auth.dart';

class LogInAndRegister extends StatefulWidget {
  const LogInAndRegister({super.key});

  @override
  State<LogInAndRegister> createState() => _LogInState();
}

class _LogInState extends State<LogInAndRegister> {
  bool isLogin = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // User login function
  Future<void> logInWithEmailAndPassword() async {
    try {
      await Auth().logInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showSnackBar(e.message, context);
    }
  }

  // User create account function
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
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

            // Application Name
            Text(
              isLogin? 'Login User' : 'Create User',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),

            // Spacing
            const SizedBox(
              height: 10,
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

            // Login or Register Button
            InkWell(
              onTap: isLogin
                  ? logInWithEmailAndPassword
                  : createUserWithEmailAndPassword,
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
                child: Text(
                  isLogin ? 'Login' : 'Register',
                  style: const TextStyle(
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
                  child: Text(
                    isLogin
                        ? "Don't have an account? "
                        : "Already have an Account? ",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (isLogin == true) {
                      setState(() {
                        isLogin = false;
                      });
                    } else {
                      setState(() {
                        isLogin = true;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Text(
                      isLogin ? "Register." : "Login",
                      style: const TextStyle(
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
