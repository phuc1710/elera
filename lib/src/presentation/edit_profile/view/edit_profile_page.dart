import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/appbar_params.dart';
import '../../../core/params/update_profile_params.dart';
import '../../../core/utils/alert.dart';
import '../../../data/models/edit_profile/country_model.dart';
import '../../../data/models/edit_profile/edit_profile_response_model.dart';
import '../../../data/models/profile/profile_response_model.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/base_bottom_sheet.dart';
import '../../widgets/base_button.dart';
import '../bloc/edit_profile_bloc.dart';
import '../widgets/phone_textfield.dart';
import '../widgets/profile_textfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.profile}) : super(key: key);

  final ProfileModel? profile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController fullNameController;
  late TextEditingController shortNameController;
  late TextEditingController dobController;
  late TextEditingController emailController;
  late TextEditingController countryController;
  late TextEditingController phoneController;
  late TextEditingController genderController;
  late TextEditingController jobController;

  CountryModel? selectedCountry;
  bool selectedGender = false;

  final genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    fullNameController =
        TextEditingController(text: widget.profile?.fullname ?? '');
    shortNameController =
        TextEditingController(text: widget.profile?.name ?? '');
    dobController = TextEditingController(text: widget.profile?.dob ?? '');
    emailController = TextEditingController(text: widget.profile?.email ?? '');
    countryController =
        TextEditingController(text: widget.profile?.country ?? '');
    phoneController = TextEditingController(text: widget.profile?.phone ?? '');
    genderController = TextEditingController(
      text: widget.profile?.gender == false ? genders[0] : genders[1],
    );
    jobController = TextEditingController(text: widget.profile?.job ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc()..add(EditProfileStarted()),
      child: Scaffold(
        appBar: buildAppBar(
          AppBarParams(context, title: 'Edit Profile'),
        ),
        body: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileFailure) {
              Alert.showAlert(context, state.msg);
            }
            if (state is EditProfileUpdateSuccess) {
              Alert.showAlert(context, state.msg);
            }
          },
          buildWhen: (_, currentState) =>
              currentState is EditProfileLoadSuccess,
          builder: (context, state) {
            if (state is EditProfileInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is EditProfileLoadSuccess) {
              return buildBody(context, state.data);
            }

            return const Center(child: Text('chưa có nội dung'));
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, EditProfileDataModel? data) {
    return SizedBox(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              ProfileTextField(controller: fullNameController),
              const SizedBox(height: 20),
              ProfileTextField(controller: shortNameController),
              const SizedBox(height: 20),
              ProfileTextField(
                controller: dobController,
                icon: const Icon(Icons.calendar_month_outlined),
              ),
              const SizedBox(height: 20),
              ProfileTextField(
                controller: emailController,
                icon: const Icon(Icons.check_box_outlined),
              ),
              const SizedBox(height: 20),
              buildCountriesDropDown(context, data),
              const SizedBox(height: 20),
              PhoneTextField(
                controller: phoneController,
                countries: data?.countries,
              ),
              const SizedBox(height: 20),
              ProfileTextField(
                controller: genderController,
                onTap: () => showModalGenders(context),
                readOnly: true,
                icon: const Icon(Icons.arrow_drop_down),
              ),
              const SizedBox(height: 20),
              ProfileTextField(controller: jobController),
              const SizedBox(height: 40),
              buildUpdateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCountriesDropDown(
    BuildContext context,
    EditProfileDataModel? data,
  ) {
    return ProfileTextField(
      controller: countryController,
      onTap: () => showModalCountries(
        context,
        countries: data?.countries ?? [],
      ),
      readOnly: true,
      icon: const Icon(Icons.arrow_drop_down),
    );
  }

  SizedBox buildUpdateButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: BaseButton(
        title: 'Update',
        titleColor: Colors.white,
        color: Colors.blue[700],
        onTap: () {
          context.read<EditProfileBloc>().add(
                EditProfileUpdated(
                  UpdateProfileParams(
                    fullname: fullNameController.text,
                    name: shortNameController.text,
                    email: emailController.text,
                    dob: dobController.text,
                    country: countryController.text,
                    phone: phoneController.text,
                    gender: selectedGender,
                    job: jobController.text,
                  ),
                ),
              );
        },
      ),
    );
  }

  void showModalCountries(
    BuildContext context, {
    required List<CountryModel?> countries,
  }) {
    return showBaseBottomSheet(
      context: context,
      title: 'Select country',
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: countries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) {
          return buildSheetItem(
            context,
            title: countries[index]?.name,
            onTap: () {
              selectedCountry = countries[index];
              countryController.text = countries[index]?.name ?? '';
            },
          );
        },
      ),
    );
  }

  void showModalGenders(BuildContext context) {
    return showBaseBottomSheet(
      context: context,
      title: 'Select gender',
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: genders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) {
          return buildSheetItem(
            context,
            title: genders[index],
            onTap: () {
              selectedGender = index == 1;
              genderController.text = genders[index];
            },
          );
        },
      ),
    );
  }

  ListTile buildSheetItem(
    BuildContext context, {
    String? title,
    required Function() onTap,
  }) {
    return ListTile(
      onTap: () {
        onTap.call();
        Navigator.of(context).pop();
      },
      title: Text(
        title ?? '',
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.black),
      ),
    );
  }
}
