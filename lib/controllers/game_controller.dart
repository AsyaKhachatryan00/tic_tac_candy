import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_candy/dialogs/win_results.dart';
import 'package:tic_tac_candy/utils/util.dart';

class GameController extends GetxController {
  bool xTurn = true;
  final RxString currentDisplayElement = 'assets/images/x.png'.obs;
  final List<String> data = ['', '', '', '', '', '', '', '', ''].obs;
  String user = '';
  RxBool xWiner = true.obs;

  int fillBoard = 0;

  final RxInt xScore = 0.obs;
  final RxInt yScore = 0.obs;

  final RxInt xGames = 0.obs;
  final RxInt yGames = 0.obs;
  final RxBool stopInteraction = false.obs;
  final _prefs = SharedPreferences.getInstance();

  @override
  Future<void> onReady() async {
    await _prefs.then((prefs) => xScore.value = prefs.getInt('xScore') ?? 0);
    await _prefs.then((prefs) => yScore.value = prefs.getInt('yScore') ?? 0);
    await _prefs.then((prefs) => xGames.value = prefs.getInt('xGames') ?? 0);
    await _prefs.then((prefs) => yGames.value = prefs.getInt('yGames') ?? 0);
    await _prefs.then((prefs) => user = prefs.getString('name') ?? '');
    update();
    super.onReady();
  }

  void openGetXDialog(String displayElement) {
    if (displayElement == 'assets/images/x.png') {
      Get.dialog(WinResults(
        onTap: () => onRepeat(),
      ));
    } else if (displayElement == 'assets/images/o.png') {
      Get.dialog(WinResults(onTap: () => onRepeat(), isWiner: false));
    } else {
      Get.dialog(WinResults(onTap: () => onRepeat(), isDraw: true));
    }
  }

  Future<void> onUserClick(int index) async {
    if (xTurn && data[index] == '') {
      data[index] = currentDisplayElement.value;
      fillBoard++;
    } else {
      data[index] = 'assets/images/o.png';
      fillBoard++;
    }

    xTurn = !xTurn;
    String winner = Util.calculateWinner(data, fillBoard);
    if (winner == 'assets/images/x.png') {
      xScore.value++;
      stopInteraction.value = true;
      xGames.value++;
      yGames.value++;

      openGetXDialog(winner);
    } else if (winner == 'assets/images/o.png') {
      yScore.value++;
      stopInteraction.value = true;
      xWiner = false.obs;
      xGames.value++;
      yGames.value++;
      openGetXDialog(winner);
    } else if (winner == 'draw') {
      xGames.value++;
      yGames.value++;
      openGetXDialog(winner);
    }

    await _prefs.then((prefs) => prefs.setInt('xScore', xScore.value));
    await _prefs.then((prefs) => prefs.setInt('yScore', yScore.value));
    await _prefs.then((prefs) => prefs.setInt('xGames', xGames.value));
    await _prefs.then((prefs) => prefs.setInt('yGames', yGames.value));

    update();
  }

  Future<void> onRepeat() async {
    for (var i = 0; i < 9; i++) {
      data[i] = '';
      currentDisplayElement.value = 'assets/images/x.png';
    }
    stopInteraction.value = false;
    fillBoard = 0;
    xTurn = true;
    Get.back();

    update();
  }
}
