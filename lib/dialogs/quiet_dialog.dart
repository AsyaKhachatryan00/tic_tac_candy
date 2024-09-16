import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/colors.dart';
import 'package:tic_tac_candy/constants/styles.dart';

class QuietDialog extends StatelessWidget {
  const QuietDialog({this.isPaused = true, this.canExit = false, super.key});
  final bool isPaused;
  final bool canExit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.only(
                    right: 80, top: Get.size.height < 550 ? 40 : 80),
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () => Get.back(),
                    child: Ink.image(
                        width: 50,
                        height: 50,
                        image: const AssetImage('assets/icons/circle.png'),
                        child: Image.asset('assets/icons/close.png')))),
            Ink.image(
              width: Get.size.width < 350
                  ? Get.size.width / 1.2
                  : Get.size.width / 1.5,
              image: const AssetImage('assets/images/quiet.png'),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: Get.size.height < 550 ? 100 : 105),
                        alignment: Alignment.topCenter,
                        child: Text(
                            canExit
                                ? 'EXIT\n Game?'
                                : isPaused
                                    ? 'GAme\n Paused'
                                    : 'QUIT?',
                            textAlign: TextAlign.center,
                            style: getStyle(canExit ? 35 : 44))),
                    canExit
                        ? Image.asset('assets/icons/exit.png',
                            width: 100, height: 100)
                        : isPaused
                            ? const Icon(Icons.pause, color: redBerry, size: 80)
                            : SizedBox(
                                height: 120,
                                child: Center(
                                    child: Text('Leaving us so soon?',
                                        style: getStyle(20, family: 'Segoe')))),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 75),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(22),
                                      onTap: () => canExit
                                          ? exit(0)
                                          : Get.back(closeOverlays: true),
                                      child: Ink.image(
                                          width: 100,
                                          height: 70,
                                          image: const AssetImage(
                                              'assets/images/yes.png'),
                                          child: Center(
                                              child: Text(
                                                  isPaused && !canExit
                                                      ? 'Exit'
                                                      : 'Yes',
                                                  style: getStyle(20)))))),
                              InkWell(
                                borderRadius: BorderRadius.circular(22),
                                onTap: () => Get.back(),
                                child: Ink.image(
                                    width: 100,
                                    height: 70,
                                    image: const AssetImage(
                                        'assets/images/cancel.png'),
                                    child: Center(
                                        child: Text(
                                            canExit
                                                ? 'no'
                                                : isPaused
                                                    ? 'Play'
                                                    : 'cancel',
                                            style: getStyle(20)))),
                              )
                            ]))
                  ]),
            )
          ],
        ));
  }
}
