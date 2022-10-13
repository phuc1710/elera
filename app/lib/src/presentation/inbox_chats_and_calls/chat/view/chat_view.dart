import 'package:flutter/material.dart';

import '../widget/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key, this.username}) : super(key: key);

  final String? username;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: textTheme.headline6,
        title: const Text('Jenny Willona'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
        leadingWidth: 35,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: const ChatBody(),
    );
  }
}
