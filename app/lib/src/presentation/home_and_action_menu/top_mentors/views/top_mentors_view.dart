import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/top_mentors_bloc.dart';
import '../widgets/top_mentors_body.dart';

class TopMentorsView extends StatelessWidget {
  const TopMentorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).topMentors),
          titleTextStyle: Theme.of(context).textTheme.headline6,
          leadingWidth: 35,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: BlocProvider(
          create: (context) =>
              getIt<TopMentorsBloc>()..add(TopMentorsFetched()),
          child: const TopMentorsBody(),
        ),
      ),
    );
  }
}
