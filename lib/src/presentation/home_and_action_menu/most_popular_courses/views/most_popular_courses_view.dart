import 'package:flutter/material.dart';

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
          body: const MyBookmarkScaffoldBody(),
        ),
      ),
    );
  }
}
