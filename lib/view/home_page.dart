import 'package:final_app_cu/view/agenda.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/emergency.dart';
import 'package:final_app_cu/view/feedback.dart';
import 'package:final_app_cu/view/gallery_page.dart';
import 'package:final_app_cu/view/liveview.dart';
import 'package:final_app_cu/view/pdf_view.dart';
import 'package:final_app_cu/view/social_media.dart';
import 'package:final_app_cu/view/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../authcontroller.dart';
import '../models/social_media.dart';

class HomePage extends StatelessWidget {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  String greetMessage(userdata) {
    String message = "Welcome Back";
    if (userdata != null) {
      String personName = userdata!["name"];
      message = "Good ${greeting()}, $personName!!";
    }
    return message;
  }

  HomePage({super.key});
  // BottomNavigationBarController bottomNavigationBarController =
  //     Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        closeButtonStyle:
            ExpandableFabCloseButtonStyle(backgroundColor: Colors.red),
        child: Icon(Icons.support_agent_rounded),
        type: ExpandableFabType.left,
        expandedFabSize: ExpandableFabSize.regular,
        distance: 70,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            isExtended: false,
            label: Text(''),
            icon: const Icon(Icons.call),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmergencyHelpScreen(
                            loPhone: USERDATA != null
                                ? USERDATA!['lo_details'] ?? "+91-775-7543-201"
                                : "+91-775-7543-201",
                          )));
            },
          ),
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            icon: const Icon(Icons.aod_rounded),
            label: Text(''),
            isExtended: false,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeedbackForm()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Text(
                  greetMessage(USERDATA),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
              ),
              // SizedBox(
              //   height: Get.width * 0.5,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const AgendaScreen()));
              //           },
              //           child: CircleAvatar(
              //             radius: 60,
              //             backgroundColor: Color.fromRGBO(243, 232, 234, 1),
              //             // decoration: BoxDecoration(
              //             //   borderRadius: BorderRadius.circular(12.0),
              //             //   color: Colors.white,
              //             // ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: const [
              //                 Icon(
              //                   FontAwesomeIcons.computer,
              //                   color: Color(0xffD12123),
              //                   size: 25.0,
              //                 ),
              //                 SizedBox(
              //                   height: 10.0,
              //                 ),
              //                 Text(
              //                   'Session',
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 17.0,
              //                   ),
              //                 ),
              //                 //Text('Details'),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(width: 20.0),
              //       Expanded(
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const MyList()));
              //           },
              //           child: CircleAvatar(
              //             radius: 60,
              //             backgroundColor: Color.fromRGBO(243, 232, 234, 1),
              //             // decoration: BoxDecoration(
              //             //   borderRadius: BorderRadius.circular(12.0),
              //             //   color: Colors.white,
              //             // ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: const [
              //                 Icon(
              //                   Icons.people,
              //                   color: Color(0xffD12123),
              //                   size: 25.0,
              //                 ),
              //                 SizedBox(
              //                   height: 10.0,
              //                 ),
              //                 Text(
              //                   'Users',
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 17.0,
              //                   ),
              //                 ),
              //                 //Text('list'),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(width: 20.0),
              //       Expanded(
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const AgendaScreen()));
              //           },
              //           child: CircleAvatar(
              //             radius: 60,
              //             backgroundColor: Color.fromRGBO(243, 232, 234, 1),
              //             // decoration: BoxDecoration(
              //             //   borderRadius: BorderRadius.circular(12.0),
              //             //   color: Colors.white,
              //             // ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: const [
              //                 Icon(
              //                   FontAwesomeIcons.computer,
              //                   color: Color(0xffD12123),
              //                   size: 25.0,
              //                 ),
              //                 SizedBox(
              //                   height: 10.0,
              //                 ),
              //                 Text(
              //                   'Session',
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 17.0,
              //                   ),
              //                 ),
              //                 // Text('Details'),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 8.0),
              const SizedBox(height: 20.0),
              SizedBox(
                height: Get.width * 0.5 - 15,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AgendaScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                tileMode: TileMode.mirror,
                                stops: [
                                  0.7,
                                  1,
                                  0.5
                                ],
                                colors: [
                                  Color.fromRGBO(1, 205, 136, 0.8),
                                  Color.fromRGBO(1, 205, 136, 0.4),
                                  Color.fromRGBO(1, 205, 136, 0.8),
                                ]),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color.fromRGBO(1, 205, 136, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.computer,
                                    color: Color.fromRGBO(1, 205, 136, 1),
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Session',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              //Text('Center'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GalleryPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                tileMode: TileMode.mirror,
                                stops: [
                                  0.7,
                                  0.8,
                                  0.9
                                ],
                                colors: [
                                  Color.fromRGBO(255, 89, 73, 0.8),
                                  Color.fromRGBO(255, 89, 73, 0.5),
                                  Color.fromRGBO(255, 89, 73, 0.6),
                                ]),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color.fromRGBO(255, 89, 73, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: Icon(
                                    Icons.image,
                                    color: Color.fromRGBO(255, 89, 73, 1),
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Gallery',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                              //Text('Form'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              //SocialMediaScreen(),
              SizedBox(
                height: Get.width * 0.5 - 15,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyList()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              //begin: Alignment.topCenter,
                              tileMode: TileMode.mirror,
                              center: Alignment.bottomLeft,
                              stops: [0.4, 0.5, 0.9],
                              colors: [
                                Color.fromRGBO(236, 174, 75, 0.8),
                                Color.fromRGBO(236, 174, 75, 0.9),
                                Color.fromRGBO(236, 174, 75, 0.6),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color.fromRGBO(236, 174, 75, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: Icon(
                                    Icons.people,
                                    color: Color.fromRGBO(236, 174, 75, 1),
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Attendees',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              //Text('Center'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LivePage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                stops: [0.1, 0.8, 0.9],
                                tileMode: TileMode.mirror,
                                begin: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(47, 38, 217, 0.8),
                                  Color.fromRGBO(47, 38, 217, 0.4),
                                  Color.fromRGBO(47, 38, 217, 0.8),
                                ]),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color.fromRGBO(47, 38, 217, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.fire,
                                    color: Color.fromRGBO(47, 38, 217, 1),
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Live Feed',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                              //Text('Form'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: Get.width * 0.5 - 15,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.cyan.shade300,
                            Colors.cyan.shade600,
                            Colors.cyan.shade800
                          ]),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.cyan,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '  Where can you find us',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SocialMediaPage(
                                                        model: socialMediaData[
                                                            0])));

                                        // launchUrlString(
                                        //     'https://www.facebook.com/chandigarhuniversitygharuan/');
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Facebook',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 25.0,
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SocialMediaPage(
                                                        model: socialMediaData[
                                                            1])));
                                        // launchUrlString(
                                        //     'https://www.instagram.com/chandigarhuniversity');
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: const Icon(
                                          FontAwesomeIcons.instagram,
                                          color:
                                              Color.fromRGBO(214, 41, 118, 1),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Instagram',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 25.0,
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SocialMediaPage(
                                                        model: socialMediaData[
                                                            2])));
                                        // launchUrlString(
                                        //     'https://twitter.com/Chandigarh_uni');
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: const Icon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Twitter',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 25.0,
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SocialMediaPage(
                                                        model: socialMediaData[
                                                            3])));
                                        // launchUrlString(
                                        //     'https://www.linkedin.com/school/chandigarh-university/?originalSubdomain=in');
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          FontAwesomeIcons.linkedin,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Linkedin',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
