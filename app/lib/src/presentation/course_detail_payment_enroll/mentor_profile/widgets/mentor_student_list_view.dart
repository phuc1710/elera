import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../bloc/mentor_details_bloc.dart';

class MentorStudentListView extends StatefulWidget {
  const MentorStudentListView({Key? key}) : super(key: key);

  @override
  State<MentorStudentListView> createState() => _MentorStudentListViewState();
}

class _MentorStudentListViewState extends State<MentorStudentListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MentorDetailsBloc>()..add(MentorStudentsFetched()),
      child: BlocConsumer<MentorDetailsBloc, MentorDetailsState>(
        listener: (context, state) {
          if (state is MentorStudentsFetchFailure)
            Utils.showAppSnackBar(context, state.error.errorMessage);
        },
        builder: (context, state) {
          if (state is MentorStudentsFetchSuccess) {
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: state.mentorStudentData?.students?.length ?? 0,
              itemBuilder: (context, index) {
                final student = state.mentorStudentData?.students?[index];
                final textTheme = Theme.of(context).textTheme;
                final primaryColor = Theme.of(context).colorScheme.primary;

                return InkWell(
                  borderRadius: BorderRadius.circular(30.0),
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.08,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      backgroundImage:
                          Image.network('${student?.avatar}').image,
                    ),
                    title: Text(
                      '${student?.fullName}',
                      style: textTheme.bodyText2
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${student?.nickname}',
                      style: textTheme.overline
                          ?.copyWith(color: const Color(0xff616161)),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.chat, color: primaryColor),
                    ),
                  ),
                );
              },
            );
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
