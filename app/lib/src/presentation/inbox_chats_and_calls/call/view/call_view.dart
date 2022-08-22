import 'package:flutter/material.dart';

import '../widgets/call_action_row.dart';

class CallView extends StatelessWidget {
  const CallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 35,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: screenHeight * 0.12,
                  backgroundColor: secondaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: Text(
                  'Jenny Willona',
                  style: textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text('04:38 minutes', style: textTheme.caption),
            ],
          ),
          const CallActionRow()
        ],
      ),
    );
  }
}
