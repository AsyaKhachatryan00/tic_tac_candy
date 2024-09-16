import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_candy/dialogs/profile.dart';
import 'package:tic_tac_candy/dialogs/welcome_dialog.dart';
import 'package:tic_tac_candy/routes/app_routes.dart';

class WelcomeController extends GetxController {
  final TextEditingController textController = TextEditingController();
  RxString errors = 'Error comes here'.obs;
  final _prefs = SharedPreferences.getInstance();
  final RxInt winsScore = 0.obs;
  final RxInt gamesScore = 0.obs;

  @override
  Future<void> onInit() async {
    final value = await _prefs.then((prefs) => prefs.getString('name'));
    await _prefs.then((prefs) => winsScore.value = prefs.getInt('xScore') ?? 0);
    await _prefs
        .then((prefs) => gamesScore.value = prefs.getInt('xGames') ?? 0);

    if (value != null) {
      textController.text = value;
    }
    update();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (textController.value.text.isEmpty) {
      Get.dialog(const WelcomeDialog());
    }

    update();
  }

  Future<void> onProfileOpen() async {
    await _prefs.then((prefs) => winsScore.value = prefs.getInt('xScore') ?? 0);
    await _prefs
        .then((prefs) => gamesScore.value = prefs.getInt('xGames') ?? 0);
    Get.dialog(const Profile());
    
    update();
  }

  Future<void> onSave() async {
    await _prefs.then((prefs) => prefs.setString('name', textController.text));
    Get.back();
    update();
  }

  Future<void> onPageChanged() async {
    if (textController.text.isEmpty) {
      if (!Get.isDialogOpen!) {
        Get.dialog(const WelcomeDialog());
      }
      errors.value = 'Please enter name';
    } else {
      Get.back();
      await _prefs
          .then((prefs) => prefs.setString('name', textController.text));
      Get.offNamedUntil(
          Routes.game, (route) => Get.currentRoute == Routes.home);
    }
    update();
  }

  Future<void> ondialogClose() async {
    final old = await _prefs.then((prefs) => prefs.getString('name'));

    if (old != null &&
        old != textController.text &&
        textController.text.isNotEmpty) {
      textController.text = old;
    } else if (old == null) {
      textController.clear();
    }

    errors = 'Error comes here'.obs;

    Get.back();
  }

  @override
  void onClose() {
    textController.dispose();
    errors = 'Error comes here'.obs;
    super.onClose();
  }
}
