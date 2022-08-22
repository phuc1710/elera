import 'package:flutter/material.dart';

import '../widgets/mentor_profile_body.dart';

class MentorProfileView extends StatelessWidget {
  const MentorProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
        leadingWidth: 35,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: const MentorProfileBody(),
    );
  }
}
