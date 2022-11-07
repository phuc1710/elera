import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final caption = Theme.of(context).textTheme.caption;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: const Color(0xfffafafa),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          prefixIcon: const Icon(IconlyBold.message),
          hintText: AppLocalizations.of(context).email,
          hintStyle: caption?.copyWith(color: const Color(0xff9e9e9e)),
        ),
        style: caption?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
