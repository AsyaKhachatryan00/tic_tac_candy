import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/styles.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget(
      {required this.scores,
      required this.games,
      this.isX = true,
      this.name,
      super.key});
  final String scores;
  final String games;
  final bool isX;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/icons/${isX ? 'x' : 'o'}.png', width: 70, height: 70),
      Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(name ?? 'O', style: getStyle(17, family: 'Segoe'))),
      Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.fromLTRB(10, 5, Get.size.width < 350 ? 10 : 20, 5),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child:
                  Image.asset('assets/icons/wins.png', width: 30, height: 30)),
          Text(scores,
              style: const TextStyle(fontSize: 17, fontFamily: 'Segoe')),
          Padding(
              padding: EdgeInsets.only(
                  left: Get.size.width < 350 ? 15 : 30, right: 5),
              child:
                  Image.asset('assets/icons/games.png', width: 30, height: 30)),
          Text(games, style: const TextStyle(fontSize: 17, fontFamily: 'Segoe'))
        ]),
      )
    ]);
  }
}
