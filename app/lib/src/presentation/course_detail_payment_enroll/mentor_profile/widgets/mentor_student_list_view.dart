import 'package:flutter/material.dart';

import '../../../../data/models/mentor/mentor_fetch_response_model.dart';

class MentorStudentListView extends StatefulWidget {
  const MentorStudentListView({Key? key, this.mentorList}) : super(key: key);

  final List<Mentor>? mentorList;

  @override
  State<MentorStudentListView> createState() => _MentorStudentListViewState();
}

class _MentorStudentListViewState extends State<MentorStudentListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: widget.mentorList?.length ?? 0,
      itemBuilder: (context, index) {
        final mentor = widget.mentorList?[index];

        return InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.08,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              // backgroundImage: Image.network('${mentor?.avatar}').image,
            ),
            title: Text(
              '${mentor?.name}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.bold),
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
                Icons.chat_bubble_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
