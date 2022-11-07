import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/models/payment/payment_response_model.dart';
import '../../../my_course/my_completed_course/widgets/bottom_action_ink.dart';
import '../../../widgets/main_action_ink.dart';
import '../bloc/enroll_course_bloc.dart';

class EnrollCourseBody extends StatefulWidget {
  const EnrollCourseBody({Key? key}) : super(key: key);

  @override
  State<EnrollCourseBody> createState() => _EnrollCourseBodyState();
}

class _EnrollCourseBodyState extends State<EnrollCourseBody> {
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));

  String? selectedPayment = 'PayPal';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: BlocConsumer<EnrollCourseBloc, EnrollCourseState>(
            listener: (context, state) {
              if (state is EnrollCoursePaymentFetchFailure)
                Utils.showAppSnackBar(context, state.error.errorMessage);
              if (state is EnrollCourseSubmissionFailure)
                Utils.showAppSnackBar(context, state.error.errorMessage);
              if (state is EnrollCourseSubmissionSuccess)
                context.router.pushNamed(Routes.confirmPayment).then(
                      (value) => context
                          .read<EnrollCourseBloc>()
                          .add(EnrollCoursePaymentFetched()),
                    );
            },
            builder: (context, state) {
              if (state is EnrollCoursePaymentFetchSuccess) {
                return ListView(
                  children: <Widget>[
                        Text(l10n.enrollCoursePrompt, style: textTheme.caption)
                      ] +
                      buildPaymentList(state.paymentData?.items) +
                      [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () =>
                                context.router.pushNamed(Routes.newCard),
                            child: MainActionInk(
                              buttonString: l10n.addNewCard,
                              isNotMainAction: true,
                            ),
                          ),
                        )
                      ],
                );
              }

              return const LoadingWidget();
            },
          ),
        ),
        BottomActionInk(
          buttonString: '${l10n.enrollCourse} - \$40',
          action: () {
            context
                .read<EnrollCourseBloc>()
                .add(EnrollCourseSubmitted(selectedPayment));
          },
        ),
      ],
    );
  }

  List<Widget> buildPaymentList([List<PaymentModel?>? items]) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return List.generate(
      items?.length ?? 0,
      (index) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          shape: shape,
          elevation: 8,
          child: RadioListTile<String?>(
            activeColor: primaryColor,
            shape: shape,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox.square(
                    dimension: 40,
                    child: FittedBox(
                      child: Image.network('${items?[index]?.img}'),
                    ),
                  ),
                ),
                Text(
                  '${items?[index]?.name}',
                  style: textTheme.bodyText2
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            contentPadding: const EdgeInsets.all(8.0),
            controlAffinity: ListTileControlAffinity.trailing,
            value: items?[index]?.name,
            groupValue: selectedPayment,
            onChanged: (String? value) =>
                setState(() => selectedPayment = value),
          ),
        ),
      ),
    );
  }
}
