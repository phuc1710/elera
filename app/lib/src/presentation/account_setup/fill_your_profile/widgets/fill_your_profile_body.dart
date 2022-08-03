import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../bloc/fill_your_profile_bloc.dart';
import '../widgets/information_input.dart';
import '../widgets/phone_number_input.dart';
import 'avatar.dart';

class FillYourProfileBody extends StatefulWidget {
  const FillYourProfileBody({Key? key}) : super(key: key);

  @override
  State<FillYourProfileBody> createState() => _FillYourProfileBodyState();
}

class _FillYourProfileBodyState extends State<FillYourProfileBody> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String dropDownGenderValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FillYourProfileBloc, FillYourProfileState>(
      listener: (context, state) {
        if (state is FillYourProfileFailed) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is FillYourProfileSuccess) {
          context.router.pushNamed(Routes.createNewPinRoute);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Avatar(),
              InformationInput(
                hintText: 'Full Name',
                controller: fullNameController,
              ),
              InformationInput(
                hintText: 'Nickname',
                controller: nicknameController,
              ),
              // TODO(phucndh): implement date_picker from thinhhh
              InformationInput(
                hintText: 'Date of Birth',
                controller: dateOfBirthController,
                suffixIcon: const Icon(Icons.date_range_rounded),
              ),
              InformationInput(
                hintText: 'Email',
                controller: emailController,
                suffixIcon: const Icon(Icons.email_rounded),
              ),
              // TODO(phucndh): implement phone input from thinhhh
              PhoneNumberInput(
                controller: phoneNumberController,
              ),
              buildGenderDropdown(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.04,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () => onContinueButtonTapped(context),
                  child: const MainActionInk(buttonString: 'Continue'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onContinueButtonTapped(BuildContext context) {
    context.read<FillYourProfileBloc>().add(
          FillYourProfileSubmitted(
            fullName: fullNameController.text,
            nickname: nicknameController.text,
            dateOfBirth: dateOfBirthController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            gender: dropDownGenderValue,
          ),
        );
  }

  Widget buildGenderDropdown() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          height: screenHeight * 0.08,
          decoration: BoxDecoration(
            color: const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropDownGenderValue,
              icon: const Icon(Icons.arrow_drop_down_rounded),
              iconEnabledColor: const Color(0xff9e9e9e),
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: const Color(0xff9e9e9e)),
              isExpanded: true,
              hint: const Text('Gender'),
              items: getGenderItems(),
              onChanged: onDropDownGenderChanged,
            ),
          ),
        ),
      ],
    );
  }

  void onDropDownGenderChanged(String? value) {
    setState(() {
      if (value != null) {
        dropDownGenderValue = value;
      }
    });
  }

  List<DropdownMenuItem<String>> getGenderItems() {
    return ['Male', 'Female']
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }
}
