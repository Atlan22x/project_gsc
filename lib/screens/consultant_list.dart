import 'package:flutter/material.dart';
import 'package:project_gsc/screens/chatroom.dart';
import 'package:project_gsc/screens/consultant_info.dart';
import 'package:project_gsc/utils/colors.dart';

class ConsultantList extends StatelessWidget {
  const ConsultantList({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> toChatRoom() async {
      if (!context.mounted) return;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ChatRoom()));
    }

    Widget consultantCard() {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ConsultantInfo()));
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
                    child: Image.asset("assets/logo_consulawtion.png"),
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
                      const Text(
                        "Hartaka Saputra S.H.",
                        style: TextStyle(
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
                                    side: BorderSide(color: firstColor, width: 2),
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
                                    side: BorderSide(color: firstColor, width: 2),
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
        actions: [
          IconButton(
            iconSize: 32,
            icon: const Icon(
              Icons.account_circle_outlined,
              semanticLabel: 'account',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            consultantCard(),
            consultantCard(),
            consultantCard(),
            consultantCard(),
          ],
        ),
      ),
    );
  }
}