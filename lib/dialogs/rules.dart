import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/dialogs/dialog_bg.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBackground(onTap: () => Get.back(), isSmall: false, children: [
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 50),
          child: Image.asset('assets/images/rules.png')),
    ]);
  }
}
