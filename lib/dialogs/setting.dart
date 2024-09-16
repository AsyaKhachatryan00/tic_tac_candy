import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/colors.dart';
import 'package:tic_tac_candy/constants/styles.dart';
import 'package:tic_tac_candy/dialogs/dialog_bg.dart';
import 'package:tic_tac_candy/dialogs/quiet_dialog.dart';
import 'package:tic_tac_candy/widgets/play_button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBackground(isSmall: false, onTap: () => Get.back(), children: [
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 10),
          child: Text('Settings',
              style: getStyle(Get.size.width < 350 ? 28 : 32))),
      Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
              width: Get.size.width / 2,
              height: Get.size.height - 200,
              'assets/images/settings.jpg')),
      Container(
          alignment: Alignment.bottomCenter,
          child: PlayButton(text: 'ok', onTap: () => Get.back())),
      Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 90),
        child: InkWell(
          onTap: () => Get
            ..back(closeOverlays: true)
            ..dialog(const QuietDialog(canExit: true)),
          child: const Text(
            'Exit the game',
            style: TextStyle(
                color: canCan,
                fontSize: 21,
                decorationColor: canCan,
                decoration: TextDecoration.underline),
          ),
        ),
      )
    ]);
  }
}
