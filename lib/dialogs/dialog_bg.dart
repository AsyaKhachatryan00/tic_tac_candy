import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleBackground extends StatelessWidget {
  const SimpleBackground(
      {required this.children, this.onTap, this.isSmall = true, super.key});
  final List<Widget> children;
  final void Function()? onTap;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      radius: 50,
                      borderRadius: BorderRadius.circular(10),
                      onTap: onTap,
                      child: Image.asset('assets/icons/close.png',
                          width: 60, height: 70)))),
          Material(
              color: Colors.transparent,
              child: Ink.image(
                  width: Get.size.width < 350
                      ? Get.size.width / 1.1
                      : Get.size.width / 1.2,
                  height: Get.size.height < 550
                      ? Get.size.height - 120
                      : Get.size.height - 150,
                  image: AssetImage(
                      'assets/images/${isSmall ? 'small_modal_body' : 'big_modal_loby'}.png'),
                  child: Stack(
                    children: children,
                  )))
        ]));
  }
}
