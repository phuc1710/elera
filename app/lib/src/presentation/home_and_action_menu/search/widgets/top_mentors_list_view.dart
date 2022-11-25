import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/models/mentor/mentor_fetch_response_model.dart';

class TopMentorsListView extends StatefulWidget {
  const TopMentorsListView({Key? key, this.mentorList}) : super(key: key);

  final List<Mentor>? mentorList;

  @override
  State<TopMentorsListView> createState() => _TopMentorsListViewState();
}

class _TopMentorsListViewState extends State<TopMentorsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.mentorList?.length,
      itemBuilder: (context, index) {
        final mentor = widget.mentorList?[index];

        return InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.08,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              backgroundImage: Image.network('${mentor?.avatar}').image,
            ),
            title: Text(
              '${mentor?.name}',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              '${mentor?.description}',
              style: Theme.of(context).textTheme.overline?.copyWith(
                    color: const Color(0xff616161),
                  ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.chat,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
