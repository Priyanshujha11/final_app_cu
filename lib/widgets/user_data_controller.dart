import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/verify.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController {
  var userdata;
  getUserData(userID) async {
    DocumentSnapshot res = await FirebaseFirestore.instance
        .collection('companies')
        .doc(userID.toString())
        .get();
    Map<String, dynamic> m = res.data() as Map<String, dynamic>;
    userdata = m;
    print(m);
    print(m['name']);
  }
}
