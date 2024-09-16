import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/controllers/welcome_controller.dart';
import 'package:tic_tac_candy/dialogs/rules.dart';
import 'package:tic_tac_candy/dialogs/setting.dart';
import 'package:tic_tac_candy/widgets/play_button.dart';

class LobyScreen extends StatefulWidget {
  const LobyScreen({super.key});

  @override
  State<LobyScreen> createState() => _LobyScreenState();
}

class _LobyScreenState extends State<LobyScreen> {
  final WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: Column(children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () => controller.onProfileOpen(),
                  child: Image.asset('assets/icons/profile.png')),
              InkWell(
                  onTap: () => Get.dialog(const Settings()),
                  child: Image.asset('assets/icons/settings.png'))
            ]),
        Expanded(child: Center(child: Image.asset('assets/images/logo.png'))),
        PlayButton(text: 'PLAY', onTap: () => controller.onPageChanged()),
        Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () => Get.dialog(const Rules()),
              child: Ink.image(
                  width: 114,
                  height: 60,
                  image: const AssetImage('assets/icons/rules.png')),
            ))
      ]),
    ));
  }
}
