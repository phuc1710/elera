import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

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
          titleSpacing: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(IconlyLight.search))
          ],
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => context.router.pop(),
            child: const Icon(IconlyLight.arrow_left),
          ),
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
