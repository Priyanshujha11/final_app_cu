import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/view/full_page_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:final_app_cu/view/fullpagevier.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('media').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Color(0xffD12123),
              );
            }
            dynamic data = snapshot.data!.docs;
            return Container(
              color: Colors.white,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                shrinkWrap: true,
                itemCount: data.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                itemBuilder: (context, index) {
                  if (data[index]['type'] == 'picture') {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          FullPageImage(
                            imgSrc: data[index]['url'].toString(),
                            title: data[index]['desc'].toString(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                            image: NetworkImage(data[index]['url'].toString()),
                          ),
                        ),
                      ),
                    );
                  } else if (data[index]['type'] == 'video') {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          FullPageVideo(
                            videoPlayerController: VideoPlayerController.network(
                              data[index]['url'].toString(),
                            ),
                            title: data[index]['title'].toString(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data[index]['thumbnail'].toString(),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(); // handle other types of media
                  }
                },
              ),
            );
          }),
    );
  }
}

