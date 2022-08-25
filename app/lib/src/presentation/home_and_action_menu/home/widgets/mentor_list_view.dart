import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class MentorListView extends StatelessWidget {
  const MentorListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.18,
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          buildWhen: (prev, curr) =>
              prev is HomeFetchInProgress && curr is HomeFetchSuccess,
          builder: (context, state) {
            if (state is HomeFetchSuccess) {
              final mentorList = state.data?.mentors;

              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: mentorList?.length,
                itemBuilder: (_, index) => InkWell(
                  borderRadius: BorderRadius.circular(30.0),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.1,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        backgroundImage:
                            Image.network('${mentorList?[index].avatar}').image,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '${mentorList?[index].nickname}',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
