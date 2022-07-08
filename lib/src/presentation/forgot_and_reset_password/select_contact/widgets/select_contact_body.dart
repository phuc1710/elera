import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../enter_pin/views/enter_pin_view.dart';
import '../bloc/contact_selection_bloc.dart';
import '../widgets/contact_radio.dart';
import '../widgets/prompt_with_image.dart';

class SelectContactBody extends StatefulWidget {
  const SelectContactBody({Key? key, required this.email}) : super(key: key);

  final String email;
  @override
  State<SelectContactBody> createState() => _SelectContactBodyState();
}

class _SelectContactBodyState extends State<SelectContactBody> {
  dynamic _selectedIndex;
  List<IconData> iconList = [Icons.chat_rounded, Icons.email];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactSelectionBloc, ContactSelectionState>(
      listener: (context, state) {
        if (state is ContactSelectionFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is ContactSelectionSuccess) {
          Navigator.push<Object?>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => EnterPinView(contactInfo: _selectedIndex),
            ),
          ).then<void>(
            (_) => context.read<ContactSelectionBloc>().add(
                  ContactFetched(userEmail: widget.email),
                ),
          );
        }
      },
      buildWhen: (prev, curr) =>
          prev is ContactFetchInProgress && curr is! ContactFetchInProgress,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListView(
            children: [
              const PromptWithImage(),
              if (state is ContactFetchSuccess)
                Column(
                  children: List.generate(
                    state.contacts.length,
                    (index) => ContactRadio(
                      selectedValue: _selectedIndex,
                      icon: iconList[index],
                      title: 'via ${state.contacts[index]?.type}',
                      subtitle: '${state.contacts[index]?.info}',
                      onSelected: (dynamic value) =>
                          setState(() => _selectedIndex = value),
                    ),
                  ),
                ),
              if (state is ContactFetchInProgress)
                const Center(child: CircularProgressIndicator()),
              InkWell(
                onTap: () => onContinueButtonTapped(context),
                borderRadius: BorderRadius.circular(40),
                child: const MainActionInk(buttonString: 'Continue'),
              ),
            ],
          ),
        );
      },
    );
  }

  void onContinueButtonTapped(BuildContext context) {
    if (_selectedIndex != null)
      context.read<ContactSelectionBloc>().add(
            ContactSelectionSubmitted(contactInfo: _selectedIndex),
          );
    else {
      context
          .read<ContactSelectionBloc>()
          .add(const ContactNoSelectionSubmitted());
    }
  }
}
