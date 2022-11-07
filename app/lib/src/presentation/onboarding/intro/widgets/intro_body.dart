import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';
import '../../../widgets/main_action_ink.dart';
import 'intro_page.dart';
import 'page_indicator.dart';

class IntroBody extends StatefulWidget {
  const IntroBody({
    Key? key,
    required this.initButtonString,
  }) : super(key: key);

  final String initButtonString;

  @override
  State<IntroBody> createState() => _IntroBodyState();
}

class _IntroBodyState extends State<IntroBody> {
  final _controller = PageController();
  int page = 0;
  String _buttonString = '';

  @override
  void initState() {
    super.initState();
    _buttonString = widget.initButtonString;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: screenHeight * 0.8,
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) => setState(() {
                  page = index;
                  _buttonString = page > 1
                      ? AppLocalizations.of(context).getStarted
                      : AppLocalizations.of(context).next;
                }),
                children: getIntroPages,
              ),
              PageIndicator(controller: _controller)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
              if (_buttonString == AppLocalizations.of(context).getStarted) {
                context.router.pushNamed(Routes.letsIn);
              }
            },
            child: MainActionInk(buttonString: _buttonString),
          ),
        ),
      ],
    );
  }

  List<Widget> get getIntroPages {
    final l10n = AppLocalizations.of(context);

    return [
      IntroPage(
        imagePath: 'assets/images/onboard1.png',
        text: l10n.onboarding1,
      ),
      IntroPage(
        imagePath: 'assets/images/onboard2.png',
        text: l10n.onboarding2,
      ),
      IntroPage(
        imagePath: 'assets/images/onboard3.png',
        text: l10n.onboarding3,
      ),
    ];
  }
}
