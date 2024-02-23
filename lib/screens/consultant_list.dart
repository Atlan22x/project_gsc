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
            elevation: 0,
            title: const Text(
              'Detail Konsultan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            content: SizedBox(
              height: 360,
              width: 300,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: thirdColor, width: 2),
                          color: defaultBackgroundColor,
                        ),
                        child: Image.asset(
                          'assets/konsultan1.png',
                          width: 80,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hartaka Saputra S.H.',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: greyColor,
                            ),
                            Text(
                              'Jakarta',
                              style: TextStyle(fontSize: 14, color: greyColor),
                            ),
                          ]),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Pengalaman 3 tahun',
                            style: TextStyle(
                                fontSize: 12,
                                color: blackColor,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Ulasan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      side: BorderSide(color: greyColor, width: 1),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "⭐ 4.8/5.0 | 201 Konsultasi",
                            style: TextStyle(fontSize: 12),
                          ),
                          Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Keahlihan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: secondColor,
                        ),
                        child: const Text(
                          'Perdata',
                          style: TextStyle(color: firstColor, fontSize: 12),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: secondColor,
                        ),
                        child: const Text(
                          'Pidana',
                          style: TextStyle(color: firstColor, fontSize: 12),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: secondColor,
                        ),
                        child: const Text(
                          'Internasional',
                          style: TextStyle(color: firstColor, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Tentang Konsultan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Hartaka Saputra, S.H. adalah seorang Advokat di PERADI Jakarta, yang berkantor di Natha Law, Jakarta. Dengan keanggotaannya di Pusat Bantuan Hukum PERADI, ia menyediakan layanan hukum berkualitas tinggi untuk membantu klien mengatasi berbagai masalah hukum di Jakarta dan sekitarnya.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Tutup',
                  style: TextStyle(fontSize: 14, color: firstColor),
                ),
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: defaultBackgroundColor, width: 0),
                      color: defaultBackgroundColor,
                    ),
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
                      width: 180,
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
                      leading: Icon(
                        Icons.person_outline,
                        size: 28,
                      ),
                      title: Text(
                        'Profilku',
                        style: TextStyle(fontSize: 16),
                      ),
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
                  leading: Icon(
                    Icons.lock_outline,
                    size: 28,
                  ),
                  title: Text(
                    'Privasi',
                    style: TextStyle(fontSize: 16),
                  ),
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
                      leading: Icon(
                        Icons.language,
                        size: 28,
                      ),
                      title: Text(
                        'Bahasa',
                        style: TextStyle(fontSize: 16),
                      ),
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
                  leading: Icon(
                    Icons.dark_mode_outlined,
                    size: 28,
                  ),
                  title: Text(
                    'Tampilan',
                    style: TextStyle(fontSize: 16),
                  ),
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
                  leading: Icon(
                    Icons.logout,
                    size: 28,
                  ),
                  title: Text(
                    'Keluar',
                    style: TextStyle(fontSize: 16),
                  ),
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
