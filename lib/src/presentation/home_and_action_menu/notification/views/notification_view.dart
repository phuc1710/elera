import 'package:flutter/material.dart';

import '../widgets/notification_scaffold_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Notification'),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
            ],
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: const NotificationScaffoldBody(),
        ),
      ),
    );
  }
}
