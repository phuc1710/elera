import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/update_profile_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/edit_profile/edit_profile_response_model.dart';
import '../../../domain/usecases/get_countries_usecase.dart';
import '../../../domain/usecases/update_profile_usecase.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(
    this._getCountriesUC,
    this._updateProfileUC,
  ) : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) {});

    on<EditProfileStarted>(_fetchData);

    on<EditProfileUpdated>(_updateProfile);
  }

  final GetCountriesUseCase _getCountriesUC;
  final UpdateProfileUseCase _updateProfileUC;

  Future<void> _fetchData(
    EditProfileStarted event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(EditProfileInProgress());

    final dataState = await _getCountriesUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.status == StatusCode.success) {
        emit(EditProfileLoadSuccess(res?.data));
      } else {
        emit(EditProfileFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(EditProfileFailure(msg: dataState.error?.message));
    }
  }

  Future<void> _updateProfile(
    EditProfileUpdated event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(EditProfileInProgress());

    final dataState = await _updateProfileUC(params: event.params);
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.status == StatusCode.success) {
        emit(EditProfileUpdateSuccess(res?.message));
      } else {
        emit(EditProfileFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      EditProfileFailure(msg: dataState.error?.message);
    }
  }
}
