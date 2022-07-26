import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/course_bloc.dart';
import '../widgets/most_popular_courses_body.dart';

class MostPopularCoursesView extends StatelessWidget {
  const MostPopularCoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Most popular courses'),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider<CourseBloc>(
            create: (context) => injector()..add(CourseFetched()),
            child: const MostPopularCoursesBody(),
          ),
        ),
      ),
    );
  }
}
