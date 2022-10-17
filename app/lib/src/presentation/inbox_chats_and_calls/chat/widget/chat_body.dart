import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/models/chat/chat_fetch_response_model.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({
    Key? key,
    this.firstName,
    this.lastName,
    this.messages,
  }) : super(key: key);

  final String? firstName;
  final String? lastName;
  final List<ChatMessage>? messages;

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final List<types.Message> messages = [];
  late final types.User user;

  @override
  void initState() {
    super.initState();
    user = types.User(
      id: 'u_1',
      firstName: '${widget.firstName}',
      lastName: '${widget.lastName}',
    );
    widget.messages?.forEach(handleAddMessage);
  }

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
      onSendPressed: handleSendPressed,
      user: user,
      showUserNames: true,
    );
  }

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Random().toString(),
      text: message.text,
    );

    dev.log(textMessage.toString());
    setState(() {
      messages.add(textMessage);
    });
  }

  void handleAddMessage(ChatMessage element) {
    final message = types.TextMessage(
      id: '',
      author: types.User(
        id: '${element.id}',
        firstName: element.author?.split(' ')[0],
        lastName: element.author?.split(' ')[1],
      ),
      text: '${element.text}',
    );
    messages.add(message);
  }
}
