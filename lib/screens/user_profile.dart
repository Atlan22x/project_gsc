import 'package:flutter/material.dart';
import 'package:project_gsc/utils/colors.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        backgroundColor: firstColor,
        foregroundColor: defaultBackgroundColor,
        toolbarHeight: 60,
        title: const Text(
          'Profilku',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: thirdColor, width: 2),
          color: defaultBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Informasi Profil",
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
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: defaultBackgroundColor,
              ),
              child: Image.asset(
                "assets/user1.png",
                width: 130,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Nama lengkap",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
            ),
            const Text(
              'Tuti Astuti',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Jenis Kelamin",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
            ),
            const Text(
              'Perempuan',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Tanggal Lahir",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
            ),
            const Text(
              '29/08/1998',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Nomor Handphone",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
            ),
            const Text(
              '081234567890',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Email",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
            ),
            const Text(
              'tuti.atsusi@gmail.com',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Alamat",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
            ),
            const Text(
              'Jl. Metro Indah Raya No.1, RT.11/RW.14, Papanggo, Kec. Tj. Priok, Jkt Utara, Daerah Khusus Ibukota Jakarta 14340',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
