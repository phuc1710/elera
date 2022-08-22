import 'package:flutter/material.dart';
import 'package:service_video_player/nd_video_player.dart';

import '../../../../core/utils/loading_widget.dart';

class CourseVideoView extends StatefulWidget {
  const CourseVideoView({Key? key}) : super(key: key);

  @override
  State<CourseVideoView> createState() => _CourseVideoViewState();
}

class _CourseVideoViewState extends State<CourseVideoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Material(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VideoPlayer(
              source:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
              loadingWidget: const LoadingWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
