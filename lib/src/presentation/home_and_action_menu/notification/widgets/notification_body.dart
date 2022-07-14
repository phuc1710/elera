import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../home/widgets/section_text.dart';
import '../bloc/notification_bloc.dart';
import 'notification_card.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key? key}) : super(key: key);

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
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
