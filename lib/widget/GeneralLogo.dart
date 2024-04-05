import 'package:flutter/material.dart';

class GeneralLogo extends StatelessWidget {
  const GeneralLogo({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          "assets/img_Logo_finalclinico_sinfondo.png",
          width: 130,
        ),
        child,
      ],
    );
  }
}
