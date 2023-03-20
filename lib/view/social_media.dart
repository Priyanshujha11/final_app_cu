import 'package:final_app_cu/view/profile_page.dart';
import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/social_media.dart';

class SocialMediaPage extends StatelessWidget {
  getSocialMedia() {
    List<Widget> a = [];
    print(model.socialHandles.keys);
    for (String key in model.socialHandles.keys) {
      a.add(socialMediaCard(key, model.socialHandles[key]!));
    }
    return a;
  }

  final SocialMediaModel model;
  const SocialMediaPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CuAppBar(isHome: false),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(243, 232, 234, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey.shade900,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                model.profileImage,
                                height: 200,
                                width: 200,
                                // color: Colors.grey.shade300,
                                fit: BoxFit.fill,
                              ),
                            ),
                            // backgroundImage: AssetImage(
                            //   model.profileImage,
                            // ),
                          ),
                        ))
                      ],
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                model.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                  fontSize: 24.0,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                model.desc,
                                // overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(
                                height: 15,
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
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: Colors.cyan,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: getSocialMedia(),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getIcon(type) {
    if (type == "instagram") {
      return Icon(
        FontAwesomeIcons.instagram,
        color: Color.fromRGBO(214, 41, 118, 1),
      );
    }
    if (type == "twitter") {
      return Icon(
        FontAwesomeIcons.twitter,
        color: Colors.lightBlue,
      );
    }
    if (type == "linkedin") {
      return Icon(
        FontAwesomeIcons.linkedin,
        color: Colors.blue.shade700,
      );
    }
    if (type == "facebook") {
      return Icon(
        FontAwesomeIcons.facebook,
        color: Colors.blue.shade700,
      );
    }

    return FontAwesomeIcons.internetExplorer;
  }

  Widget socialMediaCard(String type, String link) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            launchUrlString(link);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: getIcon(type),
          ),
        ),
        Text(
          type[0].toUpperCase() + type.substring(1),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
