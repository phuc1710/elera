import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../bloc/create_new_pin_bloc.dart';
import 'pin_code_input.dart';

class CreateNewPinBody extends StatefulWidget {
  const CreateNewPinBody({Key? key}) : super(key: key);

  @override
  State<CreateNewPinBody> createState() => _CreateNewPinBodyState();
}

class _CreateNewPinBodyState extends State<CreateNewPinBody> {
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewPinBloc, CreateNewPinState>(
      listener: (context, state) {
        if (state is CreateNewPinFailed) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is CreateNewPinSuccess) {
          context.router.pushNamed(Routes.setYourFingerprintRoute);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.1,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.05,
                ),
                child: Text(
                  'Add a pin number to make your account more secure',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              PinCodeInput(
                controller: pinController,
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                child: InkWell(
                  onTap: () => onContinueButtonTapped(context),
                  child: const MainActionInk(buttonString: 'Continue'),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void onContinueButtonTapped(BuildContext context) {
    context.read<CreateNewPinBloc>().add(
          CreateNewPinSubmitted(
            pinCode: pinController.text,
          ),
        );
  }
}
