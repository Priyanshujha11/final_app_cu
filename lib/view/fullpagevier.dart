import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullPageVideo extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String title;

  const FullPageVideo({
    Key? key,
    required this.videoPlayerController,
    required this.title,
  }) : super(key: key);

  @override
  _FullPageVideoState createState() => _FullPageVideoState();
}

class _FullPageVideoState extends State<FullPageVideo> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Color(0xffD12123),
        actions: [
          IconButton(
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _togglePlayPause,
          ),
        ],
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(
                color: Color(0xffD12123),
              ),
      ),
    );
  }
}
