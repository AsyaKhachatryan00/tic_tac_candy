import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/colors.dart';
import 'package:tic_tac_candy/constants/styles.dart';
import 'package:tic_tac_candy/controllers/welcome_controller.dart';
import 'package:tic_tac_candy/dialogs/dialog_bg.dart';
import 'package:tic_tac_candy/widgets/play_button.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({this.isSmall = true, super.key});
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<WelcomeController>(
        builder: (controller) => SimpleBackground(
            onTap: () => controller.ondialogClose(),
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  padding:
                      EdgeInsets.only(top: Get.size.height < 550 ? 25 : 50),
                  child: Text('WELCOME', style: getStyle(32))),
              Container(
                  alignment: Alignment.topCenter,
                  padding:
                      EdgeInsets.only(top: Get.size.height < 550 ? 110 : 150),
                  child: Image.asset('assets/images/line.png')),
              Container(
                  alignment: Alignment.topCenter,
                  padding:
                      EdgeInsets.only(top: Get.size.height < 550 ? 130 : 170),
                  child: Text('Enter YOUR NAME',
                      style: getStyle(Get.size.height < 550 ? 20 : 25))),
              Container(
                  alignment: Alignment.topCenter,
                  padding:
                      EdgeInsets.only(top: Get.size.height < 550 ? 240 : 280),
                  child: Text(controller.errors.obs.string,
                      style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'Segoe',
                          color: darkOrange))),
              Container(
                  alignment: Alignment.bottomCenter,
                  padding:
                      EdgeInsets.only(bottom: Get.size.height < 550 ? 0 : 15),
                  child: PlayButton(
                      text: 'PLAY', onTap: () => controller.onPageChanged())),
              Padding(
                  padding: EdgeInsets.only(
                      top: Get.size.height < 550 ? 180 : 220,
                      left: 60,
                      right: 50),
                  child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: controller.textController,
                        style: getStyle(17),
                        decoration: InputDecoration(
                            fillColor: tyrianPurple,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: redBerry),
                                borderRadius: BorderRadius.circular(22)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: redBerry),
                                borderRadius: BorderRadius.circular(22)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: redBerry),
                                borderRadius: BorderRadius.circular(22))),
                      )))
            ]),
      ),
    );
  }
}
