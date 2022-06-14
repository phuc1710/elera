import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';

class FillYourProfileView extends StatefulWidget {
  const FillYourProfileView({Key? key}) : super(key: key);

  @override
  State<FillYourProfileView> createState() => _FillYourProfileViewState();
}

class _FillYourProfileViewState extends State<FillYourProfileView> {
  String dropDownFlagValue = 'US';
  String? dropDownGenderValue;
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton<String>(
                      value: dropDownFlagValue,
                      style: Theme.of(context).textTheme.displaySmall,
                      items: const [
                        DropdownMenuItem(
                          value: 'US',
                          child: Text(
                            'US',
                          ),
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropDownFlagValue = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const InformationInput(
                        hintText: 'Phone Number',
                        keyboardtype: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButton<String>(
                value: dropDownGenderValue,
                style: Theme.of(context).textTheme.displaySmall,
                isExpanded: true,
                hint: const Text('Gender'),
                items: ['Male', 'Female']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    dropDownGenderValue = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                child: InkWell(
                    onTap: () {},
                    child: const MainActionInk(buttonString: 'Continue')),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class InformationInput extends StatelessWidget {
  const InformationInput(
      {Key? key,
      required String hintText,
      Widget? suffixIcon,
      TextInputType? keyboardtype})
      : _hintText = hintText,
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
          vertical: MediaQuery.of(context).size.height * 0.01),
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
