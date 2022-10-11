import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerHelper {
  VideoPlayerHelper({this.loadingWidget});

  final Widget? loadingWidget;

  final GlobalKey<_VideoPlayerState> videoKey = GlobalKey<_VideoPlayerState>();

  Future<void> playVideo(String source, bool isLive) async {
    await videoKey.currentState?.playVideo(source, isLive);
  }

  Widget videoPlayerWidget({
    BuildContext? context,
    String source = '',
    bool isLive = false,
  }) {
    return VideoPlayer(
      key: videoKey,
      source: source,
      loadingWidget: loadingWidget,
      isLive: isLive,
      updatePauseTime: (value) {},
    );
  }

  void pauseVideo() {
    videoKey.currentState?.pauseVideo();
  }

  void dispose() {
    videoKey.currentState?.dispose();
  }
}

class VideoPlayer extends StatefulWidget {
  VideoPlayer({
    Key? key,
    required this.source,
    this.loadingWidget,
    this.isLive = false,
    this.isAsset = false,
    this.currentTime,
    required this.updatePauseTime,
  }) : super(key: globalKey);

  static final GlobalKey<_VideoPlayerState> globalKey = GlobalKey();

  final String source;

  final bool isLive;

  final bool isAsset;

  final Widget? loadingWidget;

  final int? currentTime;

  final ValueChanged<String> updatePauseTime;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController videoPlayerController;

  ChewieController? chewieController;

  String? dataSource;

  bool _isLive = false;

  String errorVideo = '';

  @override
  void initState() {
    super.initState();
    dataSource = widget.source;
    _isLive = widget.isLive;
    playVideo(dataSource, _isLive);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: buildVideoPlayerScreen(),
    );
  }

  Widget? buildVideoPlayerScreen() {
    if (chewieController != null &&
        chewieController!.videoPlayerController.value.isInitialized) {
      return Chewie(
        controller: chewieController!,
      );
    }

    if (errorVideo.isNotEmpty) {
      return Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Text(
          errorVideo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    }

    return widget.loadingWidget;
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController?.dispose();
  }

  Future<void> playVideo(String? source, bool isLive) async {
    try {
      _isLive = isLive;
      if (mounted) {
        errorVideo = '';
        chewieController = null;
        videoPlayerController = !widget.isAsset
            ? VideoPlayerController.network(source!)
            : VideoPlayerController.file(File(source!));

        await videoPlayerController
            .initialize()
            .then((value) => videoPlayerController.addListener(() {
                  if (!videoPlayerController.value.isPlaying) {
                    var pauseTime =
                        videoPlayerController.value.position.inSeconds;
                    // print('Pause: $pauseTime');
                    widget.updatePauseTime('$pauseTime');
                  }
                }));
        chewieController = ChewieController(
          autoInitialize: true,
          isLive: _isLive,
          videoPlayerController: videoPlayerController,
          autoPlay: true, 
          looping: true,
          startAt: Duration(seconds: widget.currentTime ?? 0),
          customControls: const MaterialControls(),
          deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        );
      }
    } catch (error) {
      errorVideo = error.toString();
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> pauseVideo() async {
    await videoPlayerController.pause();
  }
}
