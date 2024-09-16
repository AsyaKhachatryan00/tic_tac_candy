import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/constants/colors.dart';
import 'package:tic_tac_candy/constants/styles.dart';
import 'package:tic_tac_candy/controllers/game_controller.dart';
import 'package:tic_tac_candy/dialogs/quiet_dialog.dart';
import 'package:tic_tac_candy/widgets/pattern_bg.dart';
import 'package:tic_tac_candy/widgets/score_widget.dart';

class MainGameScreen extends StatefulWidget {
  const MainGameScreen({super.key});

  @override
  State<MainGameScreen> createState() => _MainGameScreenState();
}

class _MainGameScreenState extends State<MainGameScreen> {
  @override
  void initState() {
    Get.put(GameController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
        builder: (controller) => PatternBg(
              showLogo: true,
              child: Stack(children: [
                controller.fillBoard < 1
                    ? Center(
                        child: Container(
                            width: Get.size.width - 50,
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(54),
                                color: mediumPurple),
                            child: Text('Your turn', style: getStyle(39))))
                    : const SizedBox(),
                Column(children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () => Get.dialog(const QuietDialog()),
                                child: Image.asset('assets/icons/home.png')),
                            Image.asset('assets/icons/settings.png')
                          ])),
                  Expanded(
                      flex: 3,
                      child: GridView.builder(
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) => IgnorePointer(
                              ignoring: controller.stopInteraction.value,
                              child: InkWell(
                                  onTap: () => controller.onUserClick(index),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color:
                                                Colors.white.withOpacity(0.2)),
                                        child: controller.data[index] == ''
                                            ? null
                                            : Image.asset(
                                                controller.data[index]),
                                      )))))),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                        ScoreWidget(
                            name: controller.user,
                            scores: controller.xScore.string,
                            games: controller.xGames.string),
                        ScoreWidget(
                            isX: false,
                            scores: controller.yScore.string,
                            games: controller.yGames.string),
                      ])))
                ]),
                if (controller.stopInteraction.value)
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        10, Get.size.height < 550 ? 270 : 315, 10, 0),
                    child: Image.asset(
                        'assets/images/${controller.xWiner.value ? 'greennew' : 'rednew'}.png'),
                  ),
              ]),
            ));
  }
}
