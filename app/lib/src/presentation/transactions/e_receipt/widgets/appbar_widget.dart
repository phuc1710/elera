import 'package:flutter/foundation.dart';
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
                if (kDebugMode) {
                  print('Share E-Receipt.');
                }
              } else if (value == 1) {
                if (kDebugMode) {
                  print('Downlead E-Receipt.');
                }
              } else if (value == 2) {
                if (kDebugMode) {
                  print('Print.');
                }
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
