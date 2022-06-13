import 'package:flutter/material.dart';

class FillYourProfileView extends StatelessWidget {
  const FillYourProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Fill your profile',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: ListView(children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.17,
                backgroundColor: Colors.red,
              ),
              const InformationInput(hintText: 'Full Name'),
              const InformationInput(hintText: 'Nickname'),
              const InformationInput(
                hintText: 'Date of Birth',
                suffixIcon: Icon(Icons.date_range_rounded),
              ),
              const InformationInput(
                hintText: 'Email',
                suffixIcon: Icon(Icons.email_rounded),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class InformationInput extends StatelessWidget {
  const InformationInput(
      {Key? key, required String hintText, Widget? suffixIcon})
      : _hintText = hintText,
        _suffixIcon = suffixIcon,
        super(key: key);

  final String _hintText;
  final Widget? _suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.0125),
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
      ),
    );
  }
}
