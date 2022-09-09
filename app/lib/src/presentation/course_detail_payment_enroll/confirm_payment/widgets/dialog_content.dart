import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';
import '../../../../config/router/routes.dart';
import '../../../widgets/main_action_ink.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'You have successfully made payment and enrolled the course.',
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  int count = 0;
                  context.router.popUntil((route) => count++ == 3);
                },
                child: const MainActionInk(
                  buttonString: 'View Course',
                  disableShadow: true,
                ),
              ),
              const SizedBox.square(dimension: 20),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {},
                child: const MainActionInk(
                  buttonString: 'View E-Receipt',
                  isNotMainAction: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
