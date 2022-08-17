import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final List<types.Message> messages = [];
  final user = const types.User(id: 'u_1', firstName: 'Phuc', lastName: 'you');

  final chatBuddy =
      const types.User(id: 'u_2', firstName: 'Willona', lastName: 'Jenny');

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Chat(
      theme: DefaultChatTheme(
        primaryColor: primaryColor,
        inputPadding: const EdgeInsets.all(20),
        inputMargin: const EdgeInsets.all(20),
        inputBorderRadius: BorderRadius.circular(20),
        inputBackgroundColor: Colors.grey,

      ),
      messages: messages.reversed.toList(),
      onSendPressed: (message) {
        final textMessage = types.TextMessage(
          author: user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: Random().toString(),
          text: message.text,
        );
        setState(() {
          messages.add(textMessage);
        });
      },
      user: user,
    );
  }
}
