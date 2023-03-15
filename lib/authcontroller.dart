import 'dart:io';
import 'package:final_app_cu/verify.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    print(phoneNumber);
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneNumber}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        throw Exception(e.message);
      },
      codeSent: ((String verificationId, int? resendToken) async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyVerify(verificationId)));
      }),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP(
    BuildContext context,
    String verificationId,
    String userOTP,
  ) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: userOTP,
    );
    await auth.signInWithCredential(credential);
    Get.offAll(AppBase());
    // Navigator.push(context, MaterialPageRoute(builder: (context) => AppBase()));
  }
}
