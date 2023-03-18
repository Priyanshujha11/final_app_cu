import 'package:final_app_cu/authcontroller.dart';
import 'package:final_app_cu/bizconnect/introduction_animation/introduction_animation_screen.dart';
import 'package:final_app_cu/controller/storage_controller.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:final_app_cu/phone.dart';
import 'bizconnect/introduction_animation/introduction_animation_screen.dart';

void main() async {

    Future<Widget> checkForAuthentication() async {
    StorageController _storage = new StorageController();
    var phone = await _storage.checkForAuth();
    if (phone != null) {
      AuthController _auth = new AuthController();
      var userDATA = await _auth.getUserData(phone);
      return AppBase(usernewId: phone, usernewData: userDATA);
    } else {
      return const MyPhone();
    }
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  PushNotificationService().initialize();
  FirebaseMessaging.onBackgroundMessage(
      PushNotificationService().backgroundHandler);
  Widget nextPage = (await checkForAuthentication());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        next: (_) => nextPage,
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
