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

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.025),
      child: InkWell(
        onTap: () => onSelected(subtitle),
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xffeeeeee),
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ContactListTile(icon: icon, title: title, subtitle: subtitle),
        ),
      ),
    );
  }
}
