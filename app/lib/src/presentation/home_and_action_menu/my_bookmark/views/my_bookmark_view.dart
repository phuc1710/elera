import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../injector/injector.dart';
import '../bloc/bookmark_bloc.dart';
import '../widgets/my_bookmark_body.dart';

class MyBookmarkView extends StatelessWidget {
  const MyBookmarkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).myBookmark),
            titleSpacing: 0,
            titleTextStyle: Theme.of(context).textTheme.headline6,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(IconlyLight.more_circle),
              )
            ],
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => context.router.pop(),
              child: const Icon(IconlyLight.arrow_left),
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider(
            create: (context) => getIt<BookmarkBloc>()..add(BookmarkFetched()),
            child: const MyBookmarkBody(),
          ),
        ),
      ),
    );
  }
}
