import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/mentor_details_bloc.dart';
import '../widgets/mentor_profile_body.dart';

class MentorProfileView extends StatelessWidget {
  const MentorProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
        leadingWidth: 35,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff212121),
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: BlocProvider(
        create: (context) =>
            getIt<MentorDetailsBloc>()..add(MentorDetailsFetched()),
        child: const MentorProfileBody(),
      ),
    );
  }
}
