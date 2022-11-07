import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:service_video_player/nd_video_player.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../injector/injector.dart';
import '../bloc/course_video_bloc.dart';

class CourseVideoView extends StatefulWidget {
  const CourseVideoView({
    Key? key,
    this.courseId,
    this.lessonId,
    this.videoLink,
    this.currentTime,
  }) : super(key: key);

  final String? courseId;
  final String? lessonId;
  final String? videoLink;
  final int? currentTime;

  @override
  State<CourseVideoView> createState() => _CourseVideoViewState();
}

class _CourseVideoViewState extends State<CourseVideoView> {
  String pause = '1';

  void updatePauseTime(String pauseTime) {
    setState(() => pause = pauseTime);
    // print('Course paused: $pause');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CourseVideoBloc>(),
      child: BlocConsumer<CourseVideoBloc, CourseVideoState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: const Icon(IconlyBold.arrow_left_3),
                onPressed: () {
                  VideoPlayer.globalKey.currentState
                      ?.pauseVideo()
                      .then((value) {
                    context.read<CourseVideoBloc>().add(
                          CourseVideoTimeUpdated(
                            widget.courseId,
                            widget.lessonId,
                            pause,
                          ),
                        );
                    context.router.pop();
                  });
                },
              ),
            ),
            body: Material(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VideoPlayer(
                    source: widget.videoLink ??
                        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
                    loadingWidget: const LoadingWidget(),
                    updatePauseTime: updatePauseTime,
                    currentTime: widget.currentTime,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
