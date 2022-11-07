import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../../../my_course/my_courses/widgets/title_app_bar.dart';
import '../bloc/inbox_bloc.dart';
import '../widgets/call_list_tile.dart';
import '../widgets/chat_list_tile.dart';

class InboxTabView extends StatelessWidget {
  const InboxTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final l10n = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) => getIt<InboxBloc>()..add(InboxFetched()),
      child: Column(
        children: [
          TitleAppBar(title: l10n.inbox),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: primaryColor,
                    labelStyle: textTheme.bodyText2,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: primaryColor, width: 3),
                    ),
                    indicatorColor: primaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [Tab(text: l10n.chats), Tab(text: l10n.calls)],
                  ),
                  BlocConsumer<InboxBloc, InboxState>(
                    listener: (context, state) {
                      if (state is InboxFetchFailure)
                        Utils.showAppSnackBar(
                          context,
                          state.error?.errorMessage,
                        );
                    },
                    builder: (context, state) {
                      if (state is InboxFetchSuccess)
                        return Expanded(
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05,
                                  vertical: screenHeight * 0.02,
                                ),
                                child: ListView(
                                  children: List.generate(
                                    state.data?.chats?.length ?? 0,
                                    (index) {
                                      final chat = state.data?.chats?[index];

                                      return ChatListTile(
                                        avatar: chat?.avatar,
                                        name: chat?.name,
                                        unreadMessages: chat?.unreadMessages,
                                        lastMessage: chat?.lastMessage,
                                        laseMessageTime: chat?.lastMessageTime,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05,
                                  vertical: screenHeight * 0.02,
                                ),
                                child: ListView(
                                  children: List.generate(
                                    state.data?.calls?.length ?? 0,
                                    (index) {
                                      final call = state.data?.calls?[index];

                                      return CallListTile(
                                        avatar: call?.avatar,
                                        name: call?.name,
                                        lastCallType: call?.lastCallType,
                                        lastCallTime: call?.lastCallTime,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                      return const LoadingWidget();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
