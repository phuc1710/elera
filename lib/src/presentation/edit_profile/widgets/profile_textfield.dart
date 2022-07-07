import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    Key? key,
    required this.controller,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget? icon;
  final Function()? onTap;
  final bool readOnly;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: readOnly,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          suffixIcon: icon,
          hintText: hint,
        ),
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
