import 'package:flutter/material.dart';

import '../../home/widgets/section_text.dart';
import 'notification_card.dart';

class NotificationScaffoldBody extends StatelessWidget {
  const NotificationScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: const SectionText(text: 'Today'),
          ),
          const NotificationCard(
            imagePath: 'assets/images/noti_payment.png',
            title: 'Payment Successful!',
            description: 'You have made a course payment',
          ),
          const NotificationCard(
            imagePath: 'assets/images/noti_offer.png',
            title: "Today's Special Offer",
            description: 'You get a special promo today!',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: const SectionText(text: 'Yesterday'),
          ),
          const NotificationCard(
            imagePath: 'assets/images/noti_category.png',
            title: 'New Category Courses!',
            description: 'Now the 3D design course is available',
          ),
          const NotificationCard(
            imagePath: 'assets/images/noti_payment.png',
            title: 'Credit Card Connected!',
            description: 'Credit card has been linked!',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: const SectionText(text: 'December 22, 2024'),
          ),
          const NotificationCard(
            imagePath: 'assets/images/noti_account.png',
            title: 'Account Setup Successful!',
            description: 'Your account has been created!',
          ),
        ],
      ),
    );
  }
}
