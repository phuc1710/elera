import 'package:flutter/material.dart';

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
              radius: MediaQuery.of(context).size.width * 0.05,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              backgroundImage: Image.network('${mentor?.avatar}').image,
            ),
            title: Text(
              '${mentor?.name}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            subtitle: Text(
              '${mentor?.description}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
