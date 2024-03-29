import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/appbar_params.dart';
import '../../../core/utils/alert.dart';
import '../../../data/models/friends/friend_response_model.dart';
import '../../../injector/injector.dart';
import '../../widgets/base_appbar.dart';
import '../bloc/friends_invitation_bloc.dart';
import '../widgets/friend_tile.dart';

class FriendsInvitationView extends StatefulWidget {
  const FriendsInvitationView({Key? key}) : super(key: key);

  @override
  State<FriendsInvitationView> createState() => _FriendsInvitationViewState();
}

class _FriendsInvitationViewState extends State<FriendsInvitationView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FriendsInvitationBloc>()..add(FriendsInvitationStarted()),
      child: Scaffold(
        appBar: buildAppBar(
          AppBarParams(
            context,
            title: AppLocalizations.of(context).inviteFriends,
            backgroundColor: Colors.transparent,
          ),
        ),
        body: BlocConsumer<FriendsInvitationBloc, FriendsInvitationState>(
          listener: (context, state) {
            if (state is FriendsInvitationFailure) {
              Alert.showAlert(context, state.msg);
            }
          },
          buildWhen: (_, currentState) =>
              currentState is FriendsInvitationFetchSuccess,
          builder: (context, state) {
            if (state is FriendsInvitationFetchSuccess) {
              return buildBody(context, state.friends);
            }

            if (state is FriendsInvitationInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(child: Text(AppLocalizations.of(context).noContent));
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<FriendModel?> data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: double.maxFinite,
      width: double.maxFinite,
      child: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemBuilder: (_, index) {
          final friend = data[index];

          return BlocConsumer<FriendsInvitationBloc, FriendsInvitationState>(
            listener: (context, state) {
              if (state is FriendsInvitationInviteSuccess) {
                if (state.id == friend?.id) {
                  friend?.isInvited = true;
                }
              }
            },
            builder: (_, state) {
              return FriendTile(
                friend: friend,
                onInvited: () {
                  if (friend?.isInvited == true) {
                    return;
                  }
                  context
                      .read<FriendsInvitationBloc>()
                      .add(FriendsInvitationInvited(id: friend?.id));
                },
              );
            },
          );
        },
      ),
    );
  }
}
