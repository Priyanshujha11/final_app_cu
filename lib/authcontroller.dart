import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/phone.dart';
import 'package:final_app_cu/verify.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'controller/storage_controller.dart';

class AuthController extends GetxController {
  TextEditingController designation = TextEditingController();
  StorageController _storageController = new StorageController();
  getUserData(userID) async {
    DocumentSnapshot res = await FirebaseFirestore.instance
        .collection('companies')
        .doc(userID.toString())
        .get();
    Map<String, dynamic> m = res.data() as Map<String, dynamic>;
    print("^^^^^^^");
    print(m);
    print(m['name']);
    print("^^^^^^^");
    return m;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? usernewId;
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
      auth.setSettings(appVerificationDisabledForTesting: true);
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
                  builder: (context) => MyVerify(verificationId, usernewId!)));
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      update();
      //}
      //  else {
      //   Fluttertoast.showToast(
      //       msg: 'You are not authorised to access the application');
      // }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  Future<void> verifyOTP(
    BuildContext context,
    String verificationId,
    String phone,
    String userOTP,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      var currentUser = await auth.signInWithCredential(credential);

      bool checkForPreRegistration = await checkif(usernewId.toString());
      if (checkForPreRegistration) {
        await _storageController.addForAuth(usernewId);
        await FirebaseFirestore.instance
            .collection('companies')
            .doc(usernewId.toString())
            .update({'auth': currentUser.user!.uid});
        var userDATA = await getUserData(usernewId);
        Get.offAll(AppBase(usernewId: phone, usernewData: userDATA));
      } else {
        await FirebaseFirestore.instance
            .collection('companies')
            .doc(usernewId.toString())
            .set({
          'auth': currentUser.user!.uid,
          "contact": phone,
        });
        Get.offAll(SignUP(
          usernewId: phone,
        ));
      }

      //TODO: Check condition and navigate accordingly
      ///if(check)
      ////esle
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        Fluttertoast.showToast(msg: "Incorrect OTP");
      } else {
        Fluttertoast.showToast(msg: "Incorrect OTP");
      }
    }
  }

  void logout() {
    _storageController.deleteAuth();
    auth.signOut();
    Get.offAll(const MyPhone());
  }
}
