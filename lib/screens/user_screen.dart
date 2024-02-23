import 'package:flutter/material.dart';
import 'package:project_gsc/screens/chatroom.dart';
import 'package:project_gsc/screens/home.dart';
import 'package:project_gsc/screens/notification.dart' as screens;
import 'package:project_gsc/utils/colors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: onPageChanged,
        controller: pageController,
        children: [
          Home(),
          const ChatRoom(),
          const screens.Notification(),
        ],
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                color: defaultBackgroundColor,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                Icons.chat,
                color: defaultBackgroundColor,
              ),
              label: 'Chat'),
          NavigationDestination(
              icon: Icon(
                Icons.document_scanner_outlined,
                color: defaultBackgroundColor,
              ),
              label: 'Template'),
          NavigationDestination(
              icon: Icon(
                Icons.notifications,
                color: defaultBackgroundColor,
              ),
              label: 'Notifications')
        ],
        onDestinationSelected: navigationTapped,
        backgroundColor: firstColor,
        indicatorColor: Colors.grey,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _page,
        height: 60,
      ),
    );
  }
}
