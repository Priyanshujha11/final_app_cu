import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/gallery_page.dart';
import 'package:final_app_cu/view/home_page.dart';
import 'package:final_app_cu/view/liveview.dart';
import 'package:final_app_cu/view/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  RxInt currentPage = 0.obs;
  final appPages = [
    HomePage(),
    // const GalleryPage(),
    // // const LivePage(),
    // MyProfile(
    //   showLogout: false,
    //   id: USERID!,
    //   fromList: false,
    // ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    currentPage.value = 0;
  }
}
