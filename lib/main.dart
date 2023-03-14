import 'package:final_app_cu/view/home_page.dart';
import 'package:final_app_cu/view/phone_signup_screen.dart';
import 'package:final_app_cu/view/verify_otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'home': (context) => HomePage()
    },
  ));
}