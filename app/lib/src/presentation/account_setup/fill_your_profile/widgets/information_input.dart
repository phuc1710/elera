import 'package:flutter/material.dart';

class InformationInput extends StatelessWidget {
  const InformationInput({
    Key? key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.keyboardtype,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardtype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        style: Theme.of(context).textTheme.displaySmall,
        keyboardType: keyboardtype,
      ),
    );
  }
}
