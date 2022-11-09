import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.03),
      child: TextField(
        decoration: InputDecoration(
          fillColor: const Color(0xfffafafa),
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          prefixIcon: const Icon(IconlyBold.lock),
          suffixIcon: IconButton(
            icon: Icon(_showPassword ? IconlyBold.hide : IconlyBold.show),
            onPressed: () => setState(() => _showPassword = !_showPassword),
          ),
          hintText: widget.hint,
        ),
        obscureText: _showPassword,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
