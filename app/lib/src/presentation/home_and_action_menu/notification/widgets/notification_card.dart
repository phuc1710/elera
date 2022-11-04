import 'package:flutter/material.dart';

import 'notification_content_column.dart';
import 'notification_image.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Row(
          children: [
            NotificationImage(imagePath: imagePath),
            NotificationContentColumn(title: title, description: description),
          ],
        ),
      ),
    );
  }
}
