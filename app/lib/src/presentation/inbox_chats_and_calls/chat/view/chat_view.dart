import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../bloc/chat_bloc.dart';
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
        title: Text('$username'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
        leadingWidth: 35,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: BlocProvider(
        create: (context) => getIt<ChatBloc>()..add(ChatFetched()),
        child: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is ChatFetchFailure)
              Utils.showAppSnackBar(context, state.error?.errorMessage);
          },
          buildWhen: (previous, current) =>
              previous is ChatFetchInProgress && current is ChatFetchSuccess,
          builder: (context, state) {
            if (state is ChatFetchSuccess) {
              return ChatBody(
                firstName: username?.split(' ')[0],
                lastName: username?.split(' ')[1],
                messages: state.data?.messages,
              );
            }

            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
