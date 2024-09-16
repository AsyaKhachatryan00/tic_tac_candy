import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_candy/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.initial,
    getPages: AppPages.getPages(),
  ));
}
