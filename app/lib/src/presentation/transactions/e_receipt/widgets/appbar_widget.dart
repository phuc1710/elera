import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      titleTextStyle: textTheme.headline6,
      title: Text(title),
      // actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)

      //   )
      // ],
      actions: [
        PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            offset: const Offset(0, 50),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: const [
                      Icon(Icons.share),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Share E-Receipt'),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: const [
                      Icon(Icons.download),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Downlead E-Receipt'),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: const [
                      Icon(Icons.print),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Print'),
                    ],
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print('My account menu is selected.');
              } else if (value == 1) {
                print('Settings menu is selected.');
              } else if (value == 2) {
                print('Logout menu is selected.');
              }
            }),
      ],
      leadingWidth: 35,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: screenHeight * 0.0995,
    );
  }
}
