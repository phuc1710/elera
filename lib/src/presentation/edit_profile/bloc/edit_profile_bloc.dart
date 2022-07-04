import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/params/update_profile_params.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/edit_profile/edit_profile_response_model.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) {});

    on<EditProfileStarted>(_fetchData);

    on<EditProfileUpdated>(_updateProfile);
  }

  Future<void> _fetchData(
    EditProfileStarted event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(EditProfileInProgress());
    try {
      final res = await Api.getCountries();
      if (res?.status == StatusCode.success) {
        emit(EditProfileLoadSuccess(res?.data));
      } else {
        emit(EditProfileFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const EditProfileFailure());
    }
  }

  Future<void> _updateProfile(
    EditProfileUpdated event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(EditProfileInProgress());
    try {
      final res = await Api.updateProfile(event.params);
      if (res?.status == StatusCode.success) {
        emit(EditProfileUpdateSuccess(res?.message));
      } else {
        emit(EditProfileFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const EditProfileFailure());
    }
  }
}
