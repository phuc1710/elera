import 'package:flutter/material.dart';

class InformationInput extends StatelessWidget {
  const InformationInput({
    Key? key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.keyboardtype,
    this.customPadding,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardtype;
  final EdgeInsets? customPadding;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: customPadding ??
          EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: screenWidth * 0.05, top: 16, bottom: 16),
          fillColor: const Color(0xfffafafa),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: const Color(0xff9e9e9e)),
          suffixIcon: suffixIcon,
        ),
        style: Theme.of(context).textTheme.caption,
        keyboardType: keyboardtype,
      ),
    );
  }
}
