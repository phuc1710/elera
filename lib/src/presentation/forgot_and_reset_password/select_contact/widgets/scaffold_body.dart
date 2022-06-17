import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../enter_pin/views/enter_pin_view.dart';
import '../widgets/contact_radio.dart';
import '../widgets/prompt_with_image.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  dynamic _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        children: [
          const PromptWithImage(),
          ContactRadio(
            selectedValue: _selectedIndex,
            icon: Icons.chat_rounded,
            title: 'via SMS:',
            subtitle: '+ 1 111 ******99',
            onSelected: (dynamic value) =>
                setState(() => _selectedIndex = value),
          ),
          ContactRadio(
            selectedValue: _selectedIndex,
            icon: Icons.email,
            title: 'via Email:',
            subtitle: 'and***ley@yourdomain.com',
            onSelected: (dynamic value) =>
                setState(() => _selectedIndex = value),
          ),
          InkWell(
            onTap: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) =>
                      EnterPinView(contactInfo: _selectedIndex),
                ),
              );
            },
            borderRadius: BorderRadius.circular(40),
            child: const MainActionInk(buttonString: 'Continue'),
          ),
        ],
      ),
    );
  }
}
