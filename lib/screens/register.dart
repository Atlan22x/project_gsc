import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/screens/login.dart';
// import 'package:project_gsc/screens/home.dart';
import 'package:project_gsc/utils/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
   final TextEditingController _controllerSRT = TextEditingController();

  bool isConsultant = false;

  // User create account function
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        username: _controllerUsername.text,
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        isConsultant: isConsultant,
      );
      if (!context.mounted) return;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const LogIn()));
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

            // Username
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: foregroundColor,
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: secondForegroundColor,
                ),
              ),
              controller: _controllerUsername,
            ),

            // Spacing
            const SizedBox(
              height: 12,
            ),

            // Consultant SRT Number
            Visibility(
              visible: isConsultant ? true : false,
              child: TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: foregroundColor,
                  hintText: 'No. SRT',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: secondForegroundColor,
                  ),
                ),
                controller: _controllerSRT,
              ),
            ),

            // Spacing
            Visibility(
              visible: isConsultant ? true : false,
              child: const SizedBox(
                height: 12,
              ),
            ),
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
              decoration: const InputDecoration(
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
              onTap: createUserWithEmailAndPassword,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: defaultBackgroundColor,
                  boxShadow: const [
                    BoxShadow(color: foregroundColor, spreadRadius: 2),
                  ],
                ),
                child: const Text(
                  'Buat Akun',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: foregroundColor,
                  ),
                ),
              ),
            ),

            //Spacing
            const SizedBox(
              height: 8,
            ),

            // Checkbox to register as Consultant
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Konsultan",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: foregroundColor),
                ),
                Checkbox(
                  checkColor: defaultBackgroundColor,
                  activeColor: foregroundColor,
                  value: isConsultant,
                  onChanged: (bool? value) {
                    setState(() {
                      isConsultant = value!;
                    });
                  },
                ),
              ],
            ),
            //Spacing
            const SizedBox(
              height: 8,
            ),

            // To Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: const Text(
                    "Sudah ada akun? ",
                    style: TextStyle(
                      color: secondForegroundColor,
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
                      vertical: 4,
                    ),
                    child: const Text(
                      "Masuk Akun",
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
