import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/controller/bottom_navigationbar_controller.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/profile_page.dart';
import 'package:flutter/material.dart';

class CuAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool isHome;
  CuAppBar({super.key, required this.isHome});

  final titleList = [
    'HOME',
    'GALLERY',
    'PROFILE',
  ];

  BottomNavigationBarController barController = BottomNavigationBarController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('companies')
            .doc(USERID)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Color(0xffD12123),
            );
          }
          dynamic data = snapshot.data!.data();
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    isHome == true
                        ? SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios)),
                    isHome == true ? SizedBox.shrink() : Spacer(),
                    SizedBox(
                      height: 60.0,
                      child: Image.asset('assets/app-logo.png'),
                    ),
                    const Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                    //   child: SizedBox(
                    //     height: 40.0,
                    //     child: Image.asset('assets/chandigarh-university.png'),
                    //   ),
                    // ),
                    isHome == true
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyProfile(
                                          id: USERID!, fromList: true)));
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(data['profile']),
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(90.0);
}
