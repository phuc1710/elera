import 'package:flutter/material.dart';

import '../../../profile/view/profile_screen.dart';
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
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_rounded),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.document_scanner_rounded),
              icon: Icon(Icons.document_scanner_outlined),
              label: 'My Course',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.chat_rounded),
              icon: Icon(Icons.chat_outlined),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_cart_rounded),
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Transaction',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person_rounded),
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
