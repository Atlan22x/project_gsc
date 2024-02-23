import 'package:flutter/material.dart';
import 'package:project_gsc/utils/colors.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    Widget notificationCard() {
      return Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: firstColor, width: 1),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Row(
              children: [
                Text(
                  "Ada pesan baru dari konsultan",
                  style: TextStyle(
                      color: firstColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  "12 jam lalu",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifikasi",
          style: TextStyle(
              color: defaultBackgroundColor,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: firstColor,
        foregroundColor: defaultBackgroundColor,
        toolbarHeight: 60,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notificationCard(),
            notificationCard(),
            notificationCard(),
          ],
        ),
      ),
    );
  }
}
