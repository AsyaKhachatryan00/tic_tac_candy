import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/styles.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({required this.text, this.onTap, super.key});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink.image(
          alignment: Alignment.bottomCenter,
          width: Get.size.width < 350 ? 146 : 146,
          height: Get.size.height < 550 ? 60 : 70,
          image: const AssetImage('assets/icons/button.png'),
          child: Center(child: Text(text, style: getStyle(25)))),
    );
  }
}
