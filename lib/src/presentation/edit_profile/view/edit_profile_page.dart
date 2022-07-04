import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/appbar_params.dart';
import '../../../core/utils/alert.dart';
import '../../../data/models/edit_profile/edit_profile_response_model.dart';
import '../../../data/models/profile/profile_response_model.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/base_button.dart';
import '../bloc/edit_profile_bloc.dart';
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
          },
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
              ProfileTextField(
                controller: countryController,
                icon: const Icon(Icons.arrow_drop_down),
              ),
              const SizedBox(height: 20),
              ProfileTextField(controller: phoneController),
              const SizedBox(height: 20),
              ProfileTextField(
                controller: genderController,
                icon: const Icon(Icons.arrow_drop_down),
              ),
              const SizedBox(height: 20),
              ProfileTextField(controller: jobController),
              const SizedBox(height: 40),
              buildUpdateButton(context),
              const SizedBox(height: 35),
            ],
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
