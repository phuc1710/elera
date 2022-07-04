import 'package:flutter/material.dart';

import '../../../core/params/appbar_params.dart';
import '../../../data/models/profile/profile_response_model.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/base_button.dart';
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
      text: widget.profile?.gender == true ? 'Male' : 'Female',
    );
    jobController = TextEditingController(text: widget.profile?.job ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        AppBarParams(context, title: 'Edit Profile'),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ProfileTextField(controller: fullNameController),
                const SizedBox(height: 15),
                ProfileTextField(controller: shortNameController),
                const SizedBox(height: 15),
                ProfileTextField(
                  controller: dobController,
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
                const SizedBox(height: 15),
                ProfileTextField(
                  controller: emailController,
                  icon: const Icon(Icons.check_box_outlined),
                ),
                const SizedBox(height: 15),
                ProfileTextField(
                  controller: countryController,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                ),
                const SizedBox(height: 15),
                ProfileTextField(controller: phoneController),
                const SizedBox(height: 15),
                ProfileTextField(
                  controller: genderController,
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                const SizedBox(height: 15),
                ProfileTextField(controller: jobController),
                const SizedBox(height: 30),
                buildUpdateButton(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildUpdateButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: BaseButton(
        title: 'Update',
        titleColor: Colors.white,
        color: Colors.blue[700],
      ),
    );
  }
}
