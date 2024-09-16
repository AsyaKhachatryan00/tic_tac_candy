import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/styles.dart';
import 'package:tic_tac_candy/dialogs/quiet_dialog.dart';

class WinResults extends StatelessWidget {
  const WinResults(
      {this.isWiner = true, this.isDraw = false, this.onTap, super.key});
  final bool isWiner;
  final bool isDraw;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(children: [
        Container(
            padding: const EdgeInsets.only(right: 80, top: 50),
            alignment: Alignment.topRight,
            child: InkWell(
                onTap: () => Get
                  ..back()
                  ..dialog(const QuietDialog(isPaused: false)),
                child: Ink.image(
                    width: 50,
                    height: 50,
                    image: const AssetImage('assets/icons/circle.png'),
                    child: Image.asset('assets/icons/close.png')))),
        Ink.image(
          width: Get.size.width / (1 / 2),
          height: Get.size.height / 1.5,
          image: AssetImage(
              'assets/images/${isDraw ? 'draw' : isWiner ? 'win' : 'lose'}.png'),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding:
                        EdgeInsets.only(top: Get.size.height < 550 ? 40 : 55),
                    alignment: Alignment.topCenter,
                    child: Text(
                        isDraw
                            ? 'Draw'
                            : isWiner
                                ? 'You\n win'
                                : 'You\n Failed',
                        textAlign: TextAlign.center,
                        style: getStyle(Get.size.height < 550 ? 37 : 44))),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: Get.size.height < 550 ? 25 : 40),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: onTap,
                      child: Ink.image(
                          width: Get.size.width < 350 ? 180 : 220,
                          height: 70,
                          image: const AssetImage('assets/icons/shape.png'),
                          child: Center(
                              child: Text(
                                  !isDraw && isWiner ? 'PLAY AGAIN' : 'REPLAY',
                                  style: getStyle(20)))),
                    ))
              ]),
        )
      ]),
    );
  }
}
