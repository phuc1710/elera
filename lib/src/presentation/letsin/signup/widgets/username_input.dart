import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
          ),
          prefixIcon: const Icon(Icons.email_rounded),
          hintText: 'Email',
        ),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
