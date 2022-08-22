import 'package:flutter/material.dart';

import '../../../my_course/my_courses/widgets/title_app_bar.dart';
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

    return Column(
      children: [
        const TitleAppBar(title: 'Inbox'),
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
                  tabs: const [Tab(text: 'Chats'), Tab(text: 'Calls')],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.02,
                        ),
                        child: ListView(
                          children: List.generate(
                            10,
                            (index) => const ChatListTile(),
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
                            10,
                            (index) => const CallListTile(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
