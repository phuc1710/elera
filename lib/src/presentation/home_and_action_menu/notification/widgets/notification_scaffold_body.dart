import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../home/widgets/section_text.dart';
import '../bloc/notification_bloc.dart';
import 'notification_card.dart';

class NotificationScaffoldBody extends StatelessWidget {
  const NotificationScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          if (state is NotificationFetchFailure) {
            Utils.showAppSnackBar(context, state.error.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is NotificationFetchSuccess) {
            final notification2dList = List.generate(
              state.data?.notificationList?.length ?? 0,
              (index) => [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: SectionText(
                    text: state.data?.notificationList?[index].date ?? '',
                  ),
                ),
                ...List.generate(
                    state.data?.notificationList?[index].notifications
                            ?.length ??
                        0, (childIndex) {
                  final notification = state.data?.notificationList?[index]
                      .notifications?[childIndex];

                  return NotificationCard(
                    imagePath: 'assets/images/noti_${notification?.type}.png',
                    title: '${notification?.title}',
                    description: '${notification?.description}',
                  );
                })
              ],
            );
            final notification1dList = [
              for (var list in notification2dList) ...list
            ];

            return ListView(
              children: notification1dList,
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     vertical: MediaQuery.of(context).size.height * 0.01,
              //   ),
              //   child: const SectionText(text: 'Today'),
              // ),
              // const NotificationCard(
              //   imagePath: 'assets/images/noti_payment.png',
              //   title: 'Payment Successful!',
              //   description: 'You have made a course payment',
              // ),
              // const NotificationCard(
              //   imagePath: 'assets/images/noti_offer.png',
              //   title: "Today's Special Offer",
              //   description: 'You get a special promo today!',
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     vertical: MediaQuery.of(context).size.height * 0.01,
              //   ),
              //   child: const SectionText(text: 'Yesterday'),
              // ),
              // const NotificationCard(
              //   imagePath: 'assets/images/noti_category.png',
              //   title: 'New Category Courses!',
              //   description: 'Now the 3D design course is available',
              // ),
              // const NotificationCard(
              //   imagePath: 'assets/images/noti_payment.png',
              //   title: 'Credit Card Connected!',
              //   description: 'Credit card has been linked!',
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     vertical: MediaQuery.of(context).size.height * 0.01,
              //   ),
              //   child: const SectionText(text: 'December 22, 2024'),
              // ),
              // const NotificationCard(
              //   imagePath: 'assets/images/noti_account.png',
              //   title: 'Account Setup Successful!',
              //   description: 'Your account has been created!',
              // ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
