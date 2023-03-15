import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullPageImage extends StatelessWidget {
  String imgSrc;
  String title;

  FullPageImage({
    required this.imgSrc,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: 'galleryImage',
              child: Image.network(imgSrc),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: Get.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            left: 20.0,
            child: FloatingActionButton(
              backgroundColor: const Color(0xffD12123),
              onPressed: () {
                Get.back();
              },
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
