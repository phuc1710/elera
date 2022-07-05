import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/profile/profile_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<ProfileStarted>(_fetchProfile);
  }

  Future<void> _fetchProfile(
    ProfileStarted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileInProgress());
    try {
      final res = await Api.getProfile();
      if (res?.status == StatusCode.success) {
        emit(ProfileFetchSuccess(res?.data));
      } else {
        emit(ProfileFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const ProfileFailure());
    }
  }
}
