import 'package:elearning/onboarding/intro_page.dart';
import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final _controller = PageController(
    initialPage: 0,
  );
  String _buttonString = 'Next';

  int page = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Stack(children: [
                PageView(
                  pageSnapping: true,
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      page = index;
                      if (page > 1) {
                        _buttonString = 'Get Started';
                      } else {
                        _buttonString = 'Next';
                      }
                    });
                  },
                  children: const [
                    IntroPage(
                      imagePath: 'assets/images/onboard1.png',
                      text:
                          'We provide the best learning courses & great mentors!',
                    ),
                    IntroPage(
                      imagePath: 'assets/images/onboard2.png',
                      text:
                          'Learn anytime and anywhere easily and conveniently',
                    ),
                    IntroPage(
                      imagePath: 'assets/images/onboard3.png',
                      text:
                          'Let\'s improve your skills together with Elera right now!',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: Theme.of(context).primaryColor,
                          ),
                          onDotClicked: (index) => _controller.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.04),
              child: InkWell(
                onTap: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  if (_buttonString == 'Get Started') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  }
                },
                child: MainActionInk(buttonString: _buttonString),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
