import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      leading: const Icon(Icons.adobe),
      title: Text(title),
      titleTextStyle: textTheme.headline6,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
      titleSpacing: 0,
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      toolbarHeight: screenHeight * 0.0995,
    );
  }
}
