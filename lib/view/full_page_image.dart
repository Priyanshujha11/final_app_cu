import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class FullPageImage extends StatelessWidget {
  String imgSrc;
  String title;
  String desc;
  String org;

  FullPageImage({
    required this.imgSrc,
    required this.title,
    required this.desc,
    required this.org,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 40,
              ),
            ),
            title: SizedBox(
              height: 60.0,
              child: Image.asset('assets/app-logo.png'),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Card(
                child: Hero(
                  tag: 'galleryImage',
                  child: Image.network(imgSrc),
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    desc,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 30, 20),
              child: Row(
                children: [
                  const Spacer(),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Share.share(
                            org == ''
                                ? 'https://www.instagram.com/chandigarhuniversity/'
                                : org,
                            subject: title);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xffD12123).withOpacity(0.57),
                              const Color(0xffD12123)
                            ],
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          'SHARE',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
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
