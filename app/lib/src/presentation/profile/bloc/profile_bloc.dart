import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/language/language_response_model.dart';
import '../../../data/models/profile/profile_response_model.dart';
import '../../../domain/usecases/get_profile_usecase.dart';
import '../../../domain/usecases/language_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._getProfileUC,
    this._languageUC,
  ) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<ProfileStarted>(_fetchProfile);
  }

  final GetProfileUseCase _getProfileUC;
  final LanguageUseCase _languageUC;

  Future<void> _fetchProfile(
    ProfileStarted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileInProgress());

    final dataState = await _getProfileUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.code == ErrorCode.success) {
        emit(
          ProfileFetchSuccess(
            profile: res?.data,
            language: await _languageUC(),
          ),
        );
      } else {
        emit(ProfileFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(ProfileFailure(msg: dataState.error?.message));
    }
  }
}
