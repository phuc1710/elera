import 'package:flutter/material.dart';

import '../../../core/params/appbar_params.dart';
import '../../edit_profile/widgets/profile_textfield.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/base_button.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({Key? key}) : super(key: key);

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBar(
        AppBarParams(
          context,
          title: 'Add New Card',
          backgroundColor: Colors.white,
          actions: [
            const Icon(Icons.more_horiz_outlined, color: Colors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Stack(
          children: [
            SizedBox(
              height: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      'https://lcus1storage.azureedge.net/web/v3/images/global/cardhover/TC_Front-400x252.png',
                      width: double.maxFinite,
                    ),
                    buildInputField(
                      context,
                      title: 'Card Name',
                      controller: cardNameController,
                    ),
                    buildInputField(
                      context,
                      title: 'Card Number',
                      controller: cardNumberController,
                    ),
                    buildMoreInputs(context),
                  ],
                ),
              ),
            ),
            buildAddButton(context)
          ],
        ),
      ),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: BaseButton(
        title: 'Add New Card',
        titleColor: Colors.white,
        color: Colors.blue[700],
        onTap: () {},
      ),
    );
  }

  Widget buildMoreInputs(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildInputField(
            context,
            title: 'Expiry Date',
            controller: expiryDateController,
            icon: const Icon(Icons.calendar_month),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: buildInputField(
            context,
            title: 'CVV',
            controller: cvvController,
          ),
        ),
      ],
    );
  }

  Widget buildInputField(
    BuildContext context, {
    required TextEditingController controller,
    required String title,
    Widget? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          ProfileTextField(
            controller: controller,
            hint: 'Enter $title',
            icon: icon,
          ),
        ],
      ),
    );
  }
}
