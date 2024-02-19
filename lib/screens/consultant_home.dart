import 'package:flutter/material.dart';
import 'package:project_gsc/main.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/utils/colors.dart';

class ConsultantHome extends StatefulWidget {
  const ConsultantHome({super.key});

  @override
  State<ConsultantHome> createState() => _ConsultantHomeState();
}

class _ConsultantHomeState extends State<ConsultantHome> {
  Future<void> logOut() async {
    await Auth().logOut();
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainApp()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        backgroundColor: defaultBackgroundColor,
        foregroundColor: foregroundColor,
        title: const Text("Consultant UI"),
      ),
      body: Center(
        child: IconButton(
            onPressed: () {
              logOut();
            },
            icon: const Icon(Icons.logout),
            style: const ButtonStyle(
              iconColor: MaterialStatePropertyAll(Colors.white),
            )),
      ),
    );
  }
}
