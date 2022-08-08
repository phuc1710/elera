import 'package:ez_intl/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/appbar_params.dart';
import '../../../core/utils/alert.dart';
import '../../../data/models/language/language_response_model.dart';
import '../../../injector/injector.dart';
import '../../_blocs/locale/locale_bloc.dart';
import '../../widgets/base_appbar.dart';
import '../bloc/language_bloc.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  LanguageModel? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageBloc>()..add(LanguageStarted()),
      child: Scaffold(
        appBar: buildAppBar(
          AppBarParams(
            context,
            title: 'Language',
            backgroundColor: Colors.white,
          ),
        ),
        body: BlocConsumer<LanguageBloc, LanguageState>(
          listener: (context, state) {
            if (state is LanguageFailure) {
              Alert.showAlert(context, state.msg);
            }
          },
          builder: (context, state) {
            if (state is LanguageFetchSuccess) {
              return buildBody(
                context,
                suggested: state.suggested,
                languages: state.languages,
              );
            }

            if (state is LanguageInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(child: Text('chưa có nội dung'));
          },
        ),
      ),
    );
  }

  Container buildBody(
    BuildContext context, {
    required List<LanguageModel?> suggested,
    required List<LanguageModel?> languages,
  }) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          buildSection(
            context,
            title: AppLocalizations.of(context).suggested,
            data: suggested,
          ),
          buildSection(
            context,
            title: AppLocalizations.of(context).language,
            data: languages,
          ),
        ],
      ),
    );
  }

  Widget buildSection(
    BuildContext context, {
    required String title,
    required List<LanguageModel?> data,
  }) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 20),
        ...List.generate(
          data.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: RadioListTile<LanguageModel?>(
              value: data[index],
              groupValue: selectedLanguage,
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                data[index]?.name ?? '',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onChanged: (val) {
                context.read<LanguageBloc>().add(LanguageSaved(val));
                context.read<LocaleBloc>().add(LocaleChanged('${val?.name}'));
                setState(() {
                  selectedLanguage = val;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
