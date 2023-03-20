import 'package:final_app_cu/view/about.dart';
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

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      message = "Good ${greeting()}, $personName!";
    }
    return message;
  }

  void showNoti(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              height: Get.size.height * 0.5 + 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close))
                    ],
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage:
                          AssetImage('assets/social_media/sandhu.jpeg'),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Welcome,' + 'Mr./Mrs. ' + '$name!\n',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'As Chancellor, I am thrilled to extend my warmest greetings to you all for attending CAB\'23 on behalf of Chandigarh University. We hope you have a fantastic time and enjoy the event.',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Center(
                    child: Text(
                      '\nSatnam Singh Sandhu',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Founder Chancellor',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 89, 73, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // BottomNavigationBarController bottomNavigationBarController =
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showNoti(context, USERDATA!['name']));
    print(DateTime.now().hour.toString() +
        ":" +
        DateTime.now().minute.toString());
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
                      loName: USERDATA != null
                          ? USERDATA!['lo_name'] ?? 'Adarsh'
                          : "Adarsh",
                      loPhone: USERDATA != null
                          ? USERDATA!['lo_details'] ?? "+91-775-7543-201"
                          : "+91-775-7543-201",
                    ),
                  ),
                );
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
            // FloatingActionButton.extended(
            //   backgroundColor: Colors.red,
            //   icon: const Icon(Icons.info),
            //   label: Text(''),
            //   isExtended: false,
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => AboutPage(
            //                   model: SocialMediaModel(
            //                       desc:
            //                           "Dev.ify is a service-based company specializing in website and application development as well as marketing solutions.Our team of skilled professionals delivers customized solutions that meet the unique requirements of our clients.We use the latest tools and techniques to ensure that your website or application is visually appealing, functional, secure, and scalable.",
            //                       name: "Dev.ify",
            //                       profileImage:
            //                           "assets/social_media/devify.jpeg",
            //                       // assets/social_media/sandhu.jpeg
            //                       socialHandles: {
            //                         'instagram':
            //                             "https://instagram.com/dev.ify?igshid=ZDdkNTZiNTM=",
            //                         'linkedin':
            //                             "https://www.linkedin.com/company/devify16/",
            //                         'website': "https://devify.co.in/"
            //                       }),
            //                 )));
            //   },
            // ),
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
                  height: 55,
                  child: Text(
                    greetMessage(USERDATA),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    ),
                  ),
                ),
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
                                    socialMediaHandle(
                                        context,
                                        "Shri Satnam \nSingh Sandhu",
                                        "assets/social_media/sandhu.jpeg",
                                        0),
                                    const SizedBox(
                                      width: 25.0,
                                    ),
                                    socialMediaHandle(context, "NID",
                                        "assets/social_media/nid.jpeg", 1),
                                    const SizedBox(
                                      width: 25.0,
                                    ),
                                    socialMediaHandle(context, "CWT",
                                        "assets/social_media/cwt.jpeg", 2),
                                    const SizedBox(
                                      width: 25.0,
                                    ),
                                    socialMediaHandle(context, "CU",
                                        "assets/social_media/cu.jpeg", 3),
                                  ],
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Column socialMediaHandle(context, String text, image, index) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SocialMediaPage(model: socialMediaData[index])));

            // launchUrlString(
            //     'https://www.facebook.com/chandigarhuniversitygharuan/');
          },
          icon: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: 200,
                  ))),
        ),
        Text(
          text.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
