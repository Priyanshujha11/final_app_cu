import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/verify.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final String usernewId;
  Future<bool> checkif(String? pho) async {
    bool toret = false;
    var coll = FirebaseFirestore.instance.collection('companies');
    var quer = await coll.get();
    for (var snap in quer.docs) {
      if (snap['contact'] == pho) {
        toret = true;
      }
    }
    return toret;
  }

  Future<void> signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      usernewId = "+91$phoneNumber";
      if (await checkif(usernewId)) {
        await auth.verifyPhoneNumber(
          phoneNumber: "+91$phoneNumber",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            Fluttertoast.showToast(msg: e.message!);
          },
          codeSent: ((String verificationId, int? resendToken) async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyVerify(verificationId, "+91$phoneNumber")));
          }),
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } else {
        Fluttertoast.showToast(
            msg: 'You are not authorised to access the application');
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  Future<void> verifyOTP(
    BuildContext context,
    String verificationId,
    String userOTP,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      var currentUser = await auth.signInWithCredential(credential);
      print('++++++++++++');
      print(usernewId);
      print('++++++++++++');
      await FirebaseFirestore.instance
          .collection('companies')
          .doc(usernewId.toString())
          .update({'auth': currentUser.user!.uid});

      Get.offAll(AppBase(
        usernewId: usernewId,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        Fluttertoast.showToast(msg: "Incorrect OTP");
      } else {
        Fluttertoast.showToast(msg: "Incorrect OTP");
      }
    }
  }
}
