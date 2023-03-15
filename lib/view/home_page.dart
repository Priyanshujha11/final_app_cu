import 'package:final_app_cu/view/agenda.dart';
import 'package:final_app_cu/view/emergency.dart';
import 'package:final_app_cu/view/feedback.dart';
import 'package:final_app_cu/view/user_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // BottomNavigationBarController bottomNavigationBarController =
  //     Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
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
                                builder: (context) => const AgendaScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.download,
                              size: 38.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Minutes to Minutes',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                              ),
                            ),
                            Text('(PDF)'),
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
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.menu_book,
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
            const SizedBox(height: 8.0),
            SizedBox(
              height: Get.width * 0.5 - 15,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.grey[200],
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
                                    icon: const Icon(FontAwesomeIcons.facebook),
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
                                    icon:
                                        const Icon(FontAwesomeIcons.instagram),
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
                                    icon: const Icon(FontAwesomeIcons.twitter),
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
                                    icon: const Icon(FontAwesomeIcons.linkedin),
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
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.emergency,
                              size: 38.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Emergency',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                              ),
                            ),
                            Text('Help'),
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
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.people,
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
          ],
        ),
      ),
    );
  }
}
