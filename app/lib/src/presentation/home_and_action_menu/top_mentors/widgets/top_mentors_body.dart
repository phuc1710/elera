import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../bloc/top_mentors_bloc.dart';

class TopMentorsBody extends StatelessWidget {
  const TopMentorsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopMentorsBloc, TopMentorsState>(
      listener: (context, state) {
        if (state is TopMentorsFetchFailure)
          Utils.showAppSnackBar(context, state.error.errorMessage);
      },
      builder: (context, state) {
        return state is! TopMentorsFetchSuccess
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: state.data?.mentors?.length,
                itemBuilder: (context, index) {
                  final mentor = state.data?.mentors?[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.08,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        backgroundImage:
                            Image.network('${mentor?.avatar}').image,
                      ),
                      title: Text(
                        '${mentor?.name}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${mentor?.description}',
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              color: const Color(0xff616161),
                            ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chat_bubble_outline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
