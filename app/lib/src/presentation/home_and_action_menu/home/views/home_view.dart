import 'package:ez_intl/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../profile/view/profile_view.dart';
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
    const Center(
      child: Text(
        'My Courses',
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Center(
      child: Text(
        'Inbox',
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Center(
      child: Text(
        'Transaction',
        style: TextStyle(color: Colors.black),
      ),
    ),
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
              label: l10n.myCourse,
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
      ),
    );
  }
}
