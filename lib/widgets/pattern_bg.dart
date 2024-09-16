import 'package:flutter/material.dart';
import 'package:tic_tac_candy/constants/colors.dart';

class PatternBg extends StatelessWidget {
  const PatternBg({required this.child, this.showLogo = false, super.key});
  final Widget child;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [pictonBlue, jordyBlue])),
          child: Material(
              color: Colors.transparent,
              child: Ink.image(
                  fit: BoxFit.fill,
                  image: showLogo
                      ? const AssetImage('assets/images/opacity_logo.png')
                      : const AssetImage(
                          'assets/images/pattern_background.png'),
                  child: child))),
    );
  }
}
