import 'package:flutter/material.dart';
import 'package:project_gsc/main.dart';
import 'package:project_gsc/screens/chatroom.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/utils/colors.dart';

enum Menu { profile, privacy, language, theme, logout }

class ConsultantList extends StatelessWidget {
  const ConsultantList({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logOut() async {
      await Auth().logOut();
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainApp()));
    }

    Future<void> toChatRoom() async {
      if (!context.mounted) return;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ChatRoom()));
    }

    void popupValueHandler(Menu menu) {
      if (menu == Menu.profile) {
      } else if (menu == Menu.privacy) {
      } else if (menu == Menu.language) {
      } else if (menu == Menu.theme) {
      } else if (menu == Menu.logout) {
        logOut();
      }
    }

    Future<void> _dialogBuilder(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Basic dialog title'),
            content: const Text(
              'A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Disable'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Enable'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Widget consultantCard(String photoPath, String consultantName) {
      return InkWell(
        onTap: () {
          _dialogBuilder(context);
        },
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: firstColor, width: 1),
          ),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          elevation: 0,
          child: SizedBox(
            width: double.infinity,
            height: 140,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: double.infinity,
                    child: Image.asset(photoPath),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        consultantName,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Pengalaman 3 tahun | ⭐ 4.8 (201 Konsultasi)",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40,
                        width: 240,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    defaultBackgroundColor),
                                shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    side:
                                        BorderSide(color: firstColor, width: 2),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Gratis',
                                style: TextStyle(color: blackColor),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              clipBehavior: Clip.antiAlias,
                              onPressed: () {
                                toChatRoom();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(firstColor),
                                shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    side:
                                        BorderSide(color: firstColor, width: 2),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Konsultasi',
                                style: TextStyle(color: defaultBackgroundColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        foregroundColor: defaultBackgroundColor,
        toolbarHeight: 60,
        title: const Text(
          'ConsuLawtion',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            elevation: 0,
            padding: const EdgeInsets.all(4),
            color: defaultBackgroundColor,
            position: PopupMenuPosition.under,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              side: BorderSide(color: firstColor, width: 1),
            ),
            itemBuilder: (context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.profile,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Informasiku",
                      style: TextStyle(fontSize: 18, color: blackColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    ListTile(
                      iconColor: greyColor,
                      textColor: greyColor,
                      dense: true,
                      leading: Icon(Icons.person_outline),
                      title: Text('Profilku'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.privacy,
                child: ListTile(
                  iconColor: greyColor,
                  textColor: greyColor,
                  dense: true,
                  leading: Icon(Icons.lock_outline),
                  title: Text('Privasi'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              const PopupMenuDivider(height: 20),
              const PopupMenuItem<Menu>(
                value: Menu.theme,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Pengaturan",
                      style: TextStyle(fontSize: 18, color: blackColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    ListTile(
                      iconColor: greyColor,
                      textColor: greyColor,
                      dense: true,
                      leading: Icon(Icons.language),
                      title: Text('Bahasa'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.language,
                child: ListTile(
                  iconColor: greyColor,
                  textColor: greyColor,
                  dense: true,
                  leading: Icon(Icons.dark_mode_outlined),
                  title: Text('Tampilan'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              const PopupMenuDivider(height: 20),
              const PopupMenuItem<Menu>(
                value: Menu.logout,
                child: ListTile(
                  iconColor: greyColor,
                  textColor: greyColor,
                  dense: true,
                  leading: Icon(Icons.logout),
                  title: Text('Keluar'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ],
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 36,
            ),
            onSelected: (value) {
              popupValueHandler(value);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: firstColor),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 54,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  filled: true,
                  fillColor: defaultBackgroundColor,
                  hintText: 'Telusuri Konsultan',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            consultantCard("assets/konsultan1.png", "Hartaka Saputra S.H."),
            consultantCard("assets/konsultan2.png", "Cahyanto Kuswoyo S.H. "),
            consultantCard("assets/konsultan3.png", "Mulyanto Pranowo S.H."),
            consultantCard("assets/konsultan4.png", "Tasdik Mustofa S.H."),
            consultantCard("assets/konsultan1.png", "Hartaka Saputra S.H."),
            consultantCard("assets/konsultan2.png", "Cahyanto Kuswoyo S.H. "),
            consultantCard("assets/konsultan3.png", "Mulyanto Pranowo S.H."),
            consultantCard("assets/konsultan4.png", "Tasdik Mustofa S.H."),
          ],
        ),
      ),
    );
  }
}
