import 'package:final_app_cu/view/agenda.dart';
import 'package:final_app_cu/view/emergency.dart';
import 'package:final_app_cu/view/feedback.dart';
import 'package:final_app_cu/view/liveview.dart';
import 'package:final_app_cu/view/pdf_view.dart';
import 'package:final_app_cu/view/social_media.dart';
import 'package:final_app_cu/view/user_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // BottomNavigationBarController bottomNavigationBarController =
  //     Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 232, 234, 1),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffD12123),
          onPressed: () {
            // Get.to(const Pdf());
            Get.to(const LivePage());
          },
          child: Icon(
            FontAwesomeIcons.fire,
            color: Colors.white,
          )
          // const Text(
          //   'M2M',
          //   style: TextStyle(
          //     fontWeight: FontWeight.w700,
          //     fontSize: 14,
          //   ),
          // ),
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: Get.width * 0.5,
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
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.computer,
                              color: Color(0xffD12123),
                              size: 38.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Session',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                              ),
                            ),
                            Text('Details'),
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
                                builder: (context) => const MyList()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.people,
                              color: Color(0xffD12123),
                              size: 38.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Users',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                              ),
                            ),
                            Text('list'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            // SocialMediaScreen(),
            SizedBox(
              height: Get.width * 0.5 - 15,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Social Media',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
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
                                      launchUrlString(
                                          'https://www.facebook.com/chandigarhuniversitygharuan/');
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.squareFacebook,
                                      color: Colors.blue.shade700,
                                    ),
                                  ),
                                  const Text('Facebook'),
                                ],
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      launchUrlString(
                                          'https://www.instagram.com/chandigarhuniversity');
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.instagram,
                                      color: Color.fromRGBO(214, 41, 118, 1),
                                    ),
                                  ),
                                  const Text('Instagram'),
                                ],
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      launchUrlString(
                                          'https://twitter.com/Chandigarh_uni');
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                  const Text('Twitter'),
                                ],
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      launchUrlString(
                                          'https://www.linkedin.com/school/chandigarh-university/?originalSubdomain=in');
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.linkedin,
                                      color: Colors.blue.shade700,
                                    ),
                                  ),
                                  const Text('Linkedin'),
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
            const SizedBox(height: 8.0),
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
                                builder: (context) =>
                                    const EmergencyHelpScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.emergency,
                              color: Color(0xffD12123),
                              size: 38.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Support',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                              ),
                            ),
                            Text('Center'),
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
                                builder: (context) => const FeedbackForm()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.menu_book,
                              color: Color(0xffD12123),
                              size: 38.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Feedback',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                              ),
                            ),
                            Text('Form'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
