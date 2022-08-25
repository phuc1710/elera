import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../config/router/routes.dart';
import '../../../../data/models/course_details/course_details_fetch_response_model.dart';

class MentorListTile extends StatelessWidget {
  const MentorListTile({Key? key, this.mentorData}) : super(key: key);

  final Mentor? mentorData;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () => context.router.pushNamed(Routes.mentorProfile),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          foregroundImage: Image.network('${mentorData?.avatar}').image,
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          '${mentorData?.name}',
          style: textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${mentorData?.career}',
          style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyLight.chat,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
