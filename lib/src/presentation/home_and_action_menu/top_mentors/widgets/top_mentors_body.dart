import 'package:flutter/material.dart';

class TopMentorsBody extends StatelessWidget {
  const TopMentorsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.05,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Mentor $index',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            subtitle: Text(
              'Mentor $index description',
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
        ),
      ),
    );
  }
}
