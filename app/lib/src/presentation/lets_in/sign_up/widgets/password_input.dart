import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final caption = Theme.of(context).textTheme.caption;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: widget.controller,
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
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _showPassword ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () => setState(() => _showPassword = !_showPassword),
          ),
          hintText: AppLocalizations.of(context).password,
          hintStyle: caption?.copyWith(color: const Color(0xff9e9e9e)),
        ),
        obscureText: _showPassword,
        style: caption?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
