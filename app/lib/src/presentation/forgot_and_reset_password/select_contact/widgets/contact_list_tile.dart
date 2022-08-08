import 'package:flutter/material.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        radius: 50,
        child: Icon(icon, color: Theme.of(context).colorScheme.primary),
      ),
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          title,
          style: textTheme.overline?.copyWith(color: Colors.grey[600]),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.caption?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
