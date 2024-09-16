import 'package:get/get.dart';
import 'package:tic_tac_candy/dialogs/profile.dart';
import 'package:tic_tac_candy/dialogs/welcome_dialog.dart';
import 'package:tic_tac_candy/widgets/pattern_bg.dart';
import 'package:tic_tac_candy/routes/app_routes.dart';
import 'package:tic_tac_candy/screens/loby_sceeen.dart';
import 'package:tic_tac_candy/screens/main_game_screen.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static List<GetPage> getPages() {
    return [
      GetPage(
          name: Routes.main,
          participatesInRootNavigator: true,
          preventDuplicates: true,
          page: () => const PatternBg(child: LobyScreen())),
      GetPage(name: Routes.welcome, page: () => const WelcomeDialog()),
      GetPage(name: Routes.profile, page: () => const Profile()),
      GetPage(name: Routes.game, page: () => const MainGameScreen())
    ];
  }
}
