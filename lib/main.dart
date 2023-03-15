import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/phone_signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: false, ignoreSsl: true);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        next: (_) => AppBase(),
        name: 'assets/bizconnect_splash.riv',
        until: () => Future.delayed(
          const Duration(
            seconds: 2,
          ),
        ),
        fit: BoxFit.cover,
        startAnimation: 'Splash',
        backgroundColor: Colors.white,
      ),
    ),
  );
}
