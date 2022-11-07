import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../injector/injector.dart';
import '../bloc/review_bloc.dart';
import '../widgets/review_tab_view.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: textTheme.headline6,
        title: Text(AppLocalizations.of(context).reviewsCap),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.more_circle),
          )
        ],
        leadingWidth: 35,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: BlocProvider(
        create: (context) => getIt<ReviewBloc>(),
        child: const ReviewsTabView(),
      ),
    );
  }
}
