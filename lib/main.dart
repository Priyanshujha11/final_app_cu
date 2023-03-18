import 'package:final_app_cu/bizconnect/introduction_animation/introduction_animation_screen.dart';
import 'package:final_app_cu/view/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:final_app_cu/phone.dart';

import 'bizconnect/introduction_animation/introduction_animation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  PushNotificationService().initialize();
  FirebaseMessaging.onBackgroundMessage(
      PushNotificationService().backgroundHandler);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        next: (_) => const MyPhone(),
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
