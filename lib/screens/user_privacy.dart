import 'package:flutter/material.dart';
import 'package:project_gsc/utils/colors.dart';

class UserPrivacy extends StatelessWidget {
  const UserPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        backgroundColor: firstColor,
        foregroundColor: defaultBackgroundColor,
        toolbarHeight: 60,
        title: const Text(
          'Privasi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        height: 115,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: thirdColor, width: 2),
          color: defaultBackgroundColor,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Keamanan",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: blackColor),
                ),
                Text(
                  "Ubah",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: firstColor),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Kata Sandi",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
            ),
            Text(
              '********',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
            ),
            
          ],
        ),
      ),
    );
  }
}