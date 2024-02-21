import 'package:flutter/material.dart';
import 'package:project_gsc/utils/colors.dart';

class ConsultantInfo extends StatelessWidget {
  const ConsultantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        foregroundColor: defaultBackgroundColor,
        toolbarHeight: 60,
        title: const Text(
          'Detail Konsultan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
