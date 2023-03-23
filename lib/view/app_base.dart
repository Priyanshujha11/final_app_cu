import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/controller/bottom_navigationbar_controller.dart';
import 'package:final_app_cu/view/home_page.dart';
import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var USERID;
var USERDATA;

class AppBase extends StatefulWidget {
  var usernewId;
  var usernewData;

  AppBase({required this.usernewId, required this.usernewData, super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  // BottomNavigationBarController bottomNavigationBarController =
  //     Get.put(BottomNavigationBarController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      USERID = widget.usernewId;
      USERDATA = widget.usernewData;
    });
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CuAppBar(
            isHome: true,
          ),
        ),
        //body: Text('kkkkkkkkkkkkkkkkkkkkkkkk'),
        body: HomePage(),
        // bottomNavigationBar: SizedBox(
        //   height: 65,
        //   child: BottomNavigationBar(
        //     currentIndex: controller.currentPage.value,
        //     onTap: (value) {
        //       controller.currentPage.value = value;
        //     },
        //     elevation: 0.0,
        //     iconSize: 30.0,
        //     backgroundColor: const Color(0xffD12123),
        //     selectedItemColor: const Color(0xff2B2A29),
        //     unselectedItemColor: Colors.white70,
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     //type: BottomNavigationBarType.fixed,
        //     items: const [
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.home), label: 'Home'),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.image), label: 'Gallery'),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.person), label: 'Profile'),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
