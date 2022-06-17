import 'package:flutter/material.dart';

class InformationInput extends StatelessWidget {
  const InformationInput({
    Key? key,
    required String hintText,
    Widget? suffixIcon,
    TextInputType? keyboardtype,
  })  : _hintText = hintText,
        _suffixIcon = suffixIcon,
        _keyboardtype = keyboardtype,
        super(key: key);

  final String _hintText;
  final Widget? _suffixIcon;
  final TextInputType? _keyboardtype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: TextField(
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
          hintText: _hintText,
          suffixIcon: _suffixIcon,
        ),
        style: Theme.of(context).textTheme.displaySmall,
        keyboardType: _keyboardtype,
      ),
    );
  }
}
