
import 'package:final_app_cu/controller/bottom_navigationbar_controller.dart';
import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBase extends StatelessWidget {
  AppBase({super.key});

  BottomNavigationBarController bottomNavigationBarController =
      Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavigationBarController>(
      builder: (controller) {
        return Scaffold(
          appBar: CuAppBar(
            index: controller.currentPage.value,
          ),
          body: controller.appPages[controller.currentPage.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentPage.value,
            onTap: (value) {
              controller.currentPage.value = value;
            },
            elevation: 0.0,
            iconSize: 26.0,
            backgroundColor: const Color(0xffD12123),
            selectedItemColor: const Color(0xff2B2A29),
            unselectedItemColor: Colors.white70,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.image), label: 'Gallery'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
