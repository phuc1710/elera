import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/appbar_params.dart';
import '../../../core/params/date_picker_param.dart';
import '../../../core/params/new_card_params.dart';
import '../../../core/utils/alert.dart';
import '../../../core/utils/date_picker.dart';
import '../../../core/utils/intl_helper.dart';
import '../../../injector/injector.dart';
import '../../edit_profile/widgets/profile_textfield.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/base_button.dart';
import '../bloc/new_card_bloc.dart';

class NewCardView extends StatefulWidget {
  const NewCardView({Key? key}) : super(key: key);

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewCardBloc>(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: buildAppBar(
          AppBarParams(
            context,
            title: AppLocalizations.of(context).addNewCard,
            backgroundColor: Colors.white,
            actions: [
              const Icon(Icons.more_horiz_outlined, color: Colors.black),
            ],
          ),
        ),
        body: BlocConsumer<NewCardBloc, NewCardState>(
          listener: (context, state) {
            if (state is NewCardFailure) {
              Alert.showAlert(context, state.msg);
            }
            if (state is NewCardAddSuccess) {
              Alert.showAlert(context, state.msg);
            }
          },
          builder: (context, state) => buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
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
                    title: AppLocalizations.of(context).cardName,
                    controller: cardNameController,
                  ),
                  buildInputField(
                    context,
                    title: AppLocalizations.of(context).cardNumber,
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
    );
  }

  Widget buildAddButton(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: BaseButton(
        title: AppLocalizations.of(context).addNewCard,
        titleColor: Colors.white,
        color: Theme.of(context).colorScheme.primary,
        shadow: const [
          BoxShadow(
            color: Color.fromRGBO(51, 94, 247, 0.25),
            blurRadius: 24,
            offset: Offset(4, 8),
          )
        ],
        onTap: () {
          context.read<NewCardBloc>().add(
                NewCardAdded(
                  NewCardParams(
                    cardName: cardNameController.text,
                    cardNumber: cardNumberController.text,
                    expiryDate: expiryDateController.text,
                    cvv: cvvController.text,
                  ),
                ),
              );
        },
      ),
    );
  }

  Widget buildMoreInputs(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildInputField(
            context,
            title: AppLocalizations.of(context).expiryDate,
            controller: expiryDateController,
            onTap: () => showDatePicker(context),
            icon: const Icon(Icons.calendar_month),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: buildInputField(
            context,
            title: AppLocalizations.of(context).cvv,
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
    Function()? onTap,
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
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          ProfileTextField(
            controller: controller,
            hint: '${AppLocalizations.of(context).enter} $title',
            onTap: onTap,
            readOnly: onTap != null,
            icon: icon,
          ),
        ],
      ),
    );
  }

  Future<void> showDatePicker(BuildContext context) {
    return showDatePickerView(
      context,
      param: DatePickerParam(
        controller: expiryDateController,
        setModalState: setState,
        dateFormat: IntlHelper.dateFormatter,
      ),
    );
  }
}
