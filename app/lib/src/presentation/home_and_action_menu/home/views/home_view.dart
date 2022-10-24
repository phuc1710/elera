import 'package:ez_intl/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../inbox_chats_and_calls/inbox/view/inbox_tab_view.dart';
import '../../../my_course/my_courses/view/my_courses_tab_view.dart';
import '../../../profile/view/profile_view.dart';
import '../../../transactions/view/transactions_tab_view.dart';
import '../widgets/home_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final tabs = [
    const HomeTabView(),
    const MyCoursesTabView(),
    const InboxTabView(),
    const TransactionsTabView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SafeArea(
      child: Scaffold(
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: [
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.home_rounded),
              icon: const Icon(Icons.home_outlined),
              label: l10n.home,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.document_scanner_rounded),
              icon: const Icon(Icons.document_scanner_outlined),
              label: l10n.myCourseNavBar,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.chat_rounded),
              icon: const Icon(Icons.chat_outlined),
              label: l10n.inbox,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.shopping_cart_rounded),
              icon: const Icon(Icons.shopping_cart_outlined),
              label: l10n.transaction,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.person_rounded),
              icon: const Icon(Icons.person_outline_rounded),
              label: l10n.profile,
            ),
          ],
        ),
        floatingActionButton: buildFloatingActionButton(),
      ),
    );
  }

  Container? buildFloatingActionButton() {
    return _selectedIndex == 2 ? Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(51, 94, 247, 0.25),
            blurRadius: 24,
            offset: Offset(4, 8),
          )
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    ) : null;
  }
}
