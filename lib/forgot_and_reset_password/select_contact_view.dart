import 'package:elearning/forgot_and_reset_password/enter_pin_view.dart';
import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectContactView extends StatelessWidget {
  const SelectContactView({Key? key}) : super(key: key);

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
              'Forgot Password',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: const ScaffoldBody(),
        ),
      ),
    );
  }
}

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  var _selectedIndex = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset('assets/images/contact.png')),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.025),
          child: Text(
            'Select which contact detail should we use to reset your password',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        ContactRadio(
          index: 1,
          selectedValue: _selectedIndex,
          icon: Icons.chat_rounded,
          title: 'via SMS:',
          subtitle: '+ 1 111 ******99',
          onSelected: (value) => setState(() => _selectedIndex = value),
        ),
        ContactRadio(
          index: 2,
          selectedValue: _selectedIndex,
          icon: Icons.email,
          title: 'via Email:',
          subtitle: 'and***ley@yourdomain.com',
          onSelected: (value) => setState(() => _selectedIndex = value),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)  => EnterPinView(contactInfo: _selectedIndex)));
          },
          borderRadius: BorderRadius.circular(40),
          child: const MainActionInk(buttonString: 'Continue'),
        ),
      ]),
    );
  }
}

class ContactRadio extends StatelessWidget {
  const ContactRadio({
    Key? key,
    required int index,
    required String selectedValue,
    required IconData icon,
    required String title,
    required String subtitle,
    required ValueChanged onSelected,
  })  : _index = index,
        _selectedValue = selectedValue,
        _icon = icon,
        _title = title,
        _subtitle = subtitle,
        _onSelected = onSelected,
        super(key: key);

  final int _index;
  final String _selectedValue;
  final IconData _icon;
  final String _title;
  final String _subtitle;
  final ValueChanged _onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = _subtitle == _selectedValue;
    return InkWell(
      onTap: (() => _onSelected(_subtitle)),
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.025),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              ContactListTile(icon: _icon, title: _title, subtitle: _subtitle),
        ),
      ),
    );
  }
}

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required IconData icon,
    required String title,
    required String subtitle,
  })  : _icon = icon,
        _title = title,
        _subtitle = subtitle,
        super(key: key);

  final IconData _icon;
  final String _title;
  final String _subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        radius: 50,
        child: Icon(
          _icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.symmetric(
          horizontal: 0, vertical: MediaQuery.of(context).size.height * 0.02),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          _title,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey[400],
          ),
        ),
      ),
      subtitle: Text(
        _subtitle,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
