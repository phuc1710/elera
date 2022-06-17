import 'package:flutter/material.dart';

import 'contact_list_tile.dart';

class ContactRadio extends StatelessWidget {
  const ContactRadio({
    Key? key,
    required this.selectedValue,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onSelected,
  }) : super(key: key);

  final dynamic selectedValue;
  final IconData icon;
  final String title;
  final String subtitle;
  final ValueChanged onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = subtitle == selectedValue;

    return InkWell(
      onTap: () {
        onSelected(subtitle);
      },
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.025),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ContactListTile(icon: icon, title: title, subtitle: subtitle),
        ),
      ),
    );
  }
}
