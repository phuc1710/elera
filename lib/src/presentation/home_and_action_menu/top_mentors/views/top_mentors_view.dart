import 'package:flutter/material.dart';

import '../widgets/top_mentors_body.dart';

class TopMentorsView extends StatelessWidget {
  const TopMentorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Top Mentors'),
          titleTextStyle: Theme.of(context).textTheme.titleSmall,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: const TopMentorsBody(),
      ),
    );
  }
}
