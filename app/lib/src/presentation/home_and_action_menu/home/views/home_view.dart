import 'package:ez_intl/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
              activeIcon: const Icon(IconlyBold.home),
              icon: const Icon(IconlyLight.home),
              label: l10n.home,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(IconlyBold.document),
              icon: const Icon(IconlyLight.document),
              label: l10n.myCourseNavBar,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(IconlyBold.chat),
              icon: const Icon(IconlyLight.chat),
              label: l10n.inbox,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(IconlyBold.buy),
              icon: const Icon(IconlyLight.buy),
              label: l10n.transactions,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(IconlyBold.profile),
              icon: const Icon(IconlyLight.profile),
              label: l10n.profile,
            ),
          ],
        ),
        floatingActionButton: buildFloatingActionButton(),
      ),
    );
  }

  Container? buildFloatingActionButton() {
    return _selectedIndex == 2
        ? Container(
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
          )
        : null;
  }
}
