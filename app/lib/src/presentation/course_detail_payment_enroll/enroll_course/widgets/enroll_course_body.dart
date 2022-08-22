import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';
import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../course_detail/widgets/enroll_button.dart';

class EnrollCourseBody extends StatefulWidget {
  const EnrollCourseBody({Key? key}) : super(key: key);

  @override
  State<EnrollCourseBody> createState() => _EnrollCourseBodyState();
}

class _EnrollCourseBodyState extends State<EnrollCourseBody> {
  final payment = ['Paypal', 'Google Pay', 'Apple Pay', '•••• •••• •••• 4679'];
  final imgLink = [
    'https://banner2.cleanpng.com/20180823/jfo/kisspng-paypal-logo-brand-font-payment-paypal-logo-icon-paypal-icon-logo-png-and-vecto-5b7f273deebfa6.7493516515350597739779.jpg',
    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1667px-Apple_logo_black.svg.png',
    'https://w7.pngwing.com/pngs/305/373/png-transparent-logo-mastercard-font-solar-home-text-orange-logo-thumbnail.png'
  ];
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );

  String? selectedPayment = 'Paypal';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.717,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      Text(
                        'Select the payment method you want to use',
                        style: textTheme.caption,
                      ),
                    ] +
                    buildPaymentList() +
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () =>
                              context.router.pushNamed(Routes.newCardRoute),
                          child: const MainActionInk(
                            buttonString: 'Add New Card',
                            isMainAction: false,
                          ),
                        ),
                      )
                    ],
              ),
            ),
          ),
        ),
        EnrollButton(
          action: () => context.router.pushNamed(Routes.confirmPayment),
        )
      ],
    );
  }

  List<Widget> buildPaymentList() {
    final textTheme = Theme.of(context).textTheme;

    return List.generate(
      4,
      (index) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          shape: shape,
          elevation: 8,
          child: RadioListTile(
            shape: shape,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: SizedBox.square(
                    dimension: 40,
                    child: FittedBox(
                      child: Image.network(imgLink[index]),
                    ),
                  ),
                ),
                Text(
                  payment[index],
                  style: textTheme.bodyText2
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            contentPadding: const EdgeInsets.all(8.0),
            controlAffinity: ListTileControlAffinity.trailing,
            value: payment[index],
            groupValue: selectedPayment,
            onChanged: (String? value) => setState(() {
              selectedPayment = value;
            }),
          ),
        ),
      ),
    );
  }
}
