import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../bloc/fill_your_profile_bloc.dart';
import '../widgets/information_input.dart';
import '../widgets/main_action_button.dart';
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
              InkWell(
                onTap: () => onContinueButtonTapped(context),
                child: const MainActionButton(),
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

  Padding buildGenderDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropDownGenderValue,
          style: Theme.of(context).textTheme.displaySmall,
          isExpanded: true,
          hint: const Text('Gender'),
          items: getGenderItems(),
          onChanged: onDropDownGenderChanged,
        ),
      ),
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
