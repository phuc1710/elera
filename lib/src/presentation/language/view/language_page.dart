import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/appbar_params.dart';
import '../../../core/utils/alert.dart';
import '../../../data/models/language/language_response_model.dart';
import '../../../injector/injector.dart';
import '../../widgets/base_appbar.dart';
import '../bloc/language_bloc.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  LanguageModel? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<LanguageBloc>()..add(LanguageStarted()),
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
          buildSection(context, title: 'Suggested', data: suggested),
          buildSection(context, title: 'Language', data: languages),
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
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onChanged: (val) {
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
