import 'dart:math';

import 'package:flutter/material.dart';

@immutable
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/logo.png",
          width: min(MediaQuery.sizeOf(context).width * 0.8, 400),
        )
      ],
    );
  }
}
