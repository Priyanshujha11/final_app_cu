import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/view/full_page_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:final_app_cu/view/fullpagevier.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CuAppBar(
          isHome: false,
        ),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('livestream').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffD12123),
                ),
              );
            }
            dynamic data = snapshot.data!.docs;

            return Container(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 20.0),
                itemBuilder: (context, index) {
                  if (data[index]['type'] == 'picture') {
                    return PostCard(
                        imageURL: data[index]['url'].toString(),
                        videoURL: "",
                        videoThumbnail: "",
                        title: data[index]['title'].toString(),
                        likes: data[index]['likes'],
                        type: data[index]['type'].toString(),
                        description: data[index]['desc'].toString(),
                        timestamp: data[index]['timestamp']);
                    // return GestureDetector(
                    //   onTap: () {
                    //     Get.to(
                    //       FullPageImage(
                    //         imgSrc: data[index]['url'].toString(),
                    //         title: data[index]['desc'].toString(),
                    //         desc: data[index]['desc'].toString(),
                    //         org: data[index]['original'].toString(),
                    //       ),
                    //     );
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey[200],
                    //       borderRadius: BorderRadius.circular(6.0),
                    //       image: DecorationImage(
                    //         image: NetworkImage(data[index]['url'].toString()),
                    //       ),
                    //     ),
                    //   ),
                    // );
                  } else if (data[index]['type'] == 'video') {
                    return PostCard(
                        imageURL: "",
                        videoURL: data[index]['url'].toString(),
                        videoThumbnail: data[index]['thumbnail'].toString(),
                        title: data[index]['title'].toString(),
                        type: data[index]['type'].toString(),
                        likes: data[index]['likes'],
                        description: data[index]['desc'].toString(),
                        timestamp: data[index]['timestamp']);
                    // return GestureDetector(
                    //   onTap: () {
                    //     Get.to(
                    //       VideoCard(
                    //         videoPlayerController:
                    //             VideoPlayerController.network(
                    //           data[index]['url'].toString(),
                    //         ),
                    //         thumbNailUrl: data[index]['thumbnail'].toString(),
                    //       ),
                    //     );
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey[200],
                    //       borderRadius: BorderRadius.circular(6.0),
                    //       image: DecorationImage(
                    //         image: NetworkImage(
                    //           data[index]['thumbnail'].toString(),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
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

class PostCard extends StatelessWidget {
  PostCard(
      {super.key,
      required this.imageURL,
      required this.videoURL,
      required this.videoThumbnail,
      required this.title,
      required this.type,
      required this.likes,
      required this.description,
      required this.timestamp});
  final String imageURL;
  final String videoURL;
  final String videoThumbnail;
  final String title;
  final String description;
  final String type;
  final int likes;
  final Timestamp timestamp;

  String readTimestamp(Timestamp timestamp) {
    // int timestamp = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var date =
        DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          padding: EdgeInsets.all(12),
          // height: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: const Color(0xffD12123),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              type == "picture"
                  ? Image.network(
                      imageURL,
                      fit: BoxFit.fill,
                      // height: 500,
                      width: MediaQuery.of(context).size.width,
                    )
                  : VideoCard(
                      videoPlayerController:
                          VideoPlayerController.network(videoURL),
                      thumbNailUrl: videoThumbnail),
              SizedBox(
                height: 08,
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.heart,
                    color: const Color(0xffD12123),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    FontAwesomeIcons.download,
                    color: const Color(0xffD12123),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  likes == 1
                      ? Text(
                          likes.toString() + " Like",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffD12123),
                          ),
                        )
                      : Text(
                          likes.toString() + " Likes",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffD12123),
                          ),
                        ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    ((3)).toString() + " Downloads",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffD12123),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 05,
              ),
              Text(description),
              SizedBox(
                height: 4,
              ),
              Text(
                readTimestamp(timestamp),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffD12123),
                ),
              ),
            ],
          )),
    );
  }
}

class VideoCard extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String thumbNailUrl;

  const VideoCard({
    Key? key,
    required this.videoPlayerController,
    required this.thumbNailUrl,
  }) : super(key: key);

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.videoPlayerController;
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      !_isPlaying
          ? Image.network(
              widget.thumbNailUrl,
              fit: BoxFit.fill,
              // height: 500,
              width: MediaQuery.of(context).size.width,
            )
          : Center(
              // heightFactor: 50,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : CircularProgressIndicator(
                      color: Color(0xffD12123),
                    ),
            ),
      Positioned(
        bottom: 10,
        left: 10,
        child: IconButton(
          icon: Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.black,
          ),
          onPressed: _togglePlayPause,
        ),
      ),
    ]);
  }
}
