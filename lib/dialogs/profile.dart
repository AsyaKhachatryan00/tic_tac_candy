import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/colors.dart';
import 'package:tic_tac_candy/constants/styles.dart';
import 'package:tic_tac_candy/controllers/welcome_controller.dart';
import 'package:tic_tac_candy/dialogs/dialog_bg.dart';
import 'package:tic_tac_candy/widgets/play_button.dart';

class Profile extends StatelessWidget {
  const Profile({this.isSmall = true, super.key});
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetBuilder<WelcomeController>(
            builder: (controller) => SimpleBackground(
                    onTap: () => controller.ondialogClose(),
                    isSmall: false,
                    children: [
                      Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('PROFILE',
                              style: getStyle(Get.size.width < 350 ? 28 : 32))),
                      Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                          child: Image.asset('assets/images/profile.png')),
                      Container(
                          padding: EdgeInsets.only(
                              left: Get.size.width < 350 ? 70 : 115,
                              bottom: 20),
                          alignment: Alignment.center,
                          child: Row(children: [
                            Text('ID: ', style: getStyle(16)),
                            Text('121324655649',
                                style: getStyle(16, family: 'Segoe'))
                          ])),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.asset('assets/images/line.png')),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              top: 100, left: 60, right: 50),
                          child: SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: controller.textController,
                                style: getStyle(17),
                                decoration: InputDecoration(
                                    fillColor: tyrianPurple,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: redBerry),
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: redBerry),
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: redBerry),
                                        borderRadius:
                                            BorderRadius.circular(22))),
                              ))),
                      Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(
                              bottom: Get.size.height < 550 ? 120 : 180),
                          child: Image.asset('assets/images/line.png')),
                      Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(
                              bottom: Get.size.height < 550 ? 80 : 110,
                              left: Get.size.width < 350 ? 80 : 90),
                          child: Image.asset('assets/icons/plays.png',
                              width: Get.size.width < 350 ? 30 : 50,
                              height: Get.size.width < 350 ? 30 : 50)),
                      Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(
                              bottom: Get.size.height < 550 ? 60 : 80,
                              left: Get.size.width < 350 ? 80 : 100),
                          child: Text(controller.gamesScore.string,
                              style:
                                  getStyle(Get.size.height < 550 ? 17 : 25))),
                      Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(
                              bottom: Get.size.width < 350 ? 80 : 110,
                              right: Get.size.width < 350 ? 80 : 90),
                          child: Image.asset('assets/icons/win.png',
                              width: Get.size.width < 350 ? 30 : 50,
                              height: Get.size.height < 550 ? 30 : 50)),
                      Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(
                              bottom: Get.size.height < 550 ? 60 : 80,
                              right: Get.size.width < 350 ? 80 : 100),
                          child: Text(controller.winsScore.string,
                              style:
                                  getStyle(Get.size.height < 550 ? 17 : 25))),
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: PlayButton(
                              text: 'Save', onTap: () => controller.onSave())),
                    ])));
  }
}
