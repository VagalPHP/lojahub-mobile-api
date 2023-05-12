import 'package:flutter/material.dart';

class LogoHeaderComponent extends StatelessWidget {
  const LogoHeaderComponent({super.key, required this.headerText});
  final String headerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 47, bottom: 8),
          child: Image.asset('assets/images/logos/lojahub_logo.png'),
        ),
        Text(
          headerText,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
