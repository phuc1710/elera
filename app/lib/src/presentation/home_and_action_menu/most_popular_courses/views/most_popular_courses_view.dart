import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

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
            title: Text(AppLocalizations.of(context).mostPopularCourses),
            titleTextStyle: Theme.of(context).textTheme.headline6,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(IconlyLight.search))
            ],
            titleSpacing: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () => context.router.pop(),
              child: const Icon(IconlyLight.arrow_left),
            ),
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider(
            create: (context) => getIt<CourseBloc>()..add(CourseFetched()),
            child: const MostPopularCoursesBody(),
          ),
        ),
      ),
    );
  }
}
