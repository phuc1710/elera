import 'package:flutter/material.dart';

import '../../../letsin/letsin/views/letsin_view.dart';
import 'intro_page.dart';
import 'main_action_ink.dart';
import 'page_indicator.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  final _controller = PageController();
  String _buttonString = 'Next';
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) => setState(() {
                  page = index;
                  _buttonString = page > 1 ? 'Get Started' : 'Next';
                }),
                children: getIntroPages,
              ),
              PageIndicator(controller: _controller)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.04,
          ),
          child: InkWell(
            onTap: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
              if (_buttonString == 'Get Started') {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const LetsIn(),
                  ),
                );
              }
            },
            child: MainActionInk(buttonString: _buttonString),
          ),
        ),
      ],
    );
  }

  List<Widget> get getIntroPages {
    return const [
      IntroPage(
        imagePath: 'assets/images/onboard1.png',
        text: 'We provide the best learning courses & great mentors!',
      ),
      IntroPage(
        imagePath: 'assets/images/onboard2.png',
        text: 'Learn anytime and anywhere easily and conveniently',
      ),
      IntroPage(
        imagePath: 'assets/images/onboard3.png',
        text: "Let's improve your skills together with Elera right now!",
      ),
    ];
  }
}
