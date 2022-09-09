import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:iconly/iconly.dart';

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
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final textTheme = Theme.of(context).textTheme;

    return Chat(
      theme: DefaultChatTheme(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        inputPadding: const EdgeInsets.all(20),
        inputMargin: const EdgeInsets.all(20),
        inputBorderRadius: BorderRadius.circular(20),
        inputBackgroundColor: const Color(0xfffafafa),
        attachmentButtonIcon: const Icon(IconlyLight.send),
        emptyChatPlaceholderTextStyle:
            textTheme.bodyText2?.copyWith(color: Colors.black) ??
                const TextStyle(),
        inputTextColor: const Color(0x00212121).withOpacity(1.0),
      ),
      messages: messages.reversed.toList(),
      onSendPressed: (message) {
        final textMessage = types.TextMessage(
          author: user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: Random().toString(),
          text: message.text,
          showStatus: true,
          status: types.Status.sending,
        );
        dev.log(textMessage.toString());
        setState(() => messages.add(textMessage));
      },
      user: user,
    );
  }
}
