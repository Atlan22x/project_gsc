import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/screens/register.dart';
import 'package:project_gsc/screens/home.dart';
import 'package:project_gsc/screens/consultant_home.dart';
import 'package:project_gsc/utils/colors.dart';
import 'package:project_gsc/utils/verify_consultant.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isObscure = true;
  bool isConsultant = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  // final TextEditingController _controllerSRT = TextEditingController();

  // User login function
  Future<void> logInWithEmailAndPassword() async {
    try {
      await Auth().logInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      if (!context.mounted) return;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const VerifyConsultant()));
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
      backgroundColor: defaultBackgroundColor,
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
              'ConsuLawtion',
              style: TextStyle(
                color: foregroundColor,
                fontSize: 32,
              ),
            ),

            // Spacing
            const SizedBox(
              height: 32,
            ),

            // // Consultant SRT Number
            // Visibility(
            //   visible: isConsultant ? true : false,
            //   child: TextField(
            //     decoration: const InputDecoration(
            //       filled: true,
            //       fillColor: foregroundColor,
            //       hintText: 'No. SRT',
            //       hintStyle: TextStyle(
            //         fontSize: 16,
            //         color: secondForegroundColor,
            //       ),
            //     ),
            //     controller: _controllerSRT,
            //   ),
            // ),

            // // Spacing
            // Visibility(
            //   visible: isConsultant ? true : false,
            //   child: const SizedBox(
            //     height: 12,
            //   ),
            // ),

            // Email
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: foregroundColor,
                hintText: 'Email',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: secondForegroundColor,
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
              obscureText: _isObscure,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                filled: true,
                fillColor: foregroundColor,
                hintText: 'Kata Sandi',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: secondForegroundColor,
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
              onTap: logInWithEmailAndPassword,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(color: foregroundColor, spreadRadius: 2),
                  ],
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: foregroundColor,
                  ),
                ),
              ),
            ),

            // //Spacing
            // const SizedBox(
            //   height: 8,
            // ),

            // // Checkbox to login as Consultant
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     const Text(
            //       "Konsultan",
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w400,
            //           color: foregroundColor),
            //     ),
            //     Checkbox(
            //       checkColor: defaultBackgroundColor,
            //       activeColor: foregroundColor,
            //       value: isConsultant,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isConsultant = value!;
            //         });
            //       },
            //     ),
            //   ],
            // ),

            //Spacing
            const SizedBox(
              height: 32
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
                    "Tidak ada akun? ",
                    style: TextStyle(
                      color: secondForegroundColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Register()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Buat Akun",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: foregroundColor,
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
