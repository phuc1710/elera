import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../config/router/app_router.dart';
import '../../../../core/utils/utils.dart';
import '../../../widgets/main_action_ink.dart';
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
  List<IconData> iconList = [IconlyBold.chat, IconlyBold.message];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactSelectionBloc, ContactSelectionState>(
      listener: (context, state) {
        if (state is ContactSelectionFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is ContactSelectionSuccess) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          //! Push object
          context.router
              .push(EnterPinRoute(contactInfo: _selectedIndex))
              .then<void>(
                (_) => context.read<ContactSelectionBloc>().add(
                      ContactFetched(userEmail: widget.email),
                    ),
              );
        }
      },
      buildWhen: (prev, curr) =>
          prev is ContactFetchInProgress && curr is! ContactFetchInProgress,
      builder: (context, state) {
        final l10n = AppLocalizations.of(context);

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
                      title: '${l10n.via} ${state.contacts[index]?.type}:',
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
                child: MainActionInk(buttonString: l10n.cont),
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
