import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/main.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/utils/colors.dart';
import 'package:project_gsc/screens/chatroom.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final User? user = Auth().currentUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> logOut() async {
    await Auth().logOut();
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainApp()));
  }

  Future<void> _chatRoom() async {
    if (!context.mounted) return;
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ChatRoom()));
  }

  Widget _logOutButton() {
    return ElevatedButton(
      onPressed: logOut,
      child: const Text(
        'Logout',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }


  Widget _chatRoomButton() {
    return ElevatedButton(
      onPressed: _chatRoom,
      child: const Text(
        'Chat',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConsuLawtion'),
        foregroundColor: defaultBackgroundColor,
        backgroundColor: firstColor,
        elevation: 0,
      ),
      backgroundColor: defaultBackgroundColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _chatRoomButton(),
            _logOutButton(),
          ],
        ),
      ),
    );
  }
}
