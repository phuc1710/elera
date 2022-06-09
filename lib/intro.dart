import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';

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
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Image.asset('assets/images/onboard1.png'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            'We provide the best learning courses & great mentors!',
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Image.asset('assets/images/onboard2.png'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            'Learn anytime and anywhere easily and conveniently',
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Image.asset('assets/images/onboard3.png'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            'Let\'s improve your skills together with Elera right now!',
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
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
                          effect: const ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: Color(0xff5f82ff),
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
