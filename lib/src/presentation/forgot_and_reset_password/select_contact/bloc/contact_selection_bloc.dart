import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/contact_fetch_request_params.dart';
import '../../../../core/params/contact_selection_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/contact_selection/contact_fetch_response_model.dart';
import '../../../../domain/usecases/get_contact_fetch_usecase.dart';
import '../../../../domain/usecases/post_contact_selection_usecase.dart';

part 'contact_selection_event.dart';
part 'contact_selection_state.dart';

@Injectable()
class ContactSelectionBloc
    extends Bloc<ContactSelectionEvent, ContactSelectionState> {
  ContactSelectionBloc(this.contactSelectionUseCase, this.contactFetchUseCase)
      : super(ContactSelectionInitial()) {
    on<ContactFetched>(_onContactFetched);
    on<ContactNoSelectionSubmitted>(_onContactNoSelectionSubmitted);
    on<ContactSelectionSubmitted>(_onContactSelectionSubmitted);
  }

  final ContactFetchUseCase contactFetchUseCase;
  final ContactSelectionUseCase contactSelectionUseCase;

  Future<void> _onContactFetched(
    ContactFetched event,
    Emitter<ContactSelectionState> emit,
  ) async {
    emit(ContactFetchInProgress());
    final dataState = await contactFetchUseCase(
      params: ContactFetchRequestParams(email: event.userEmail),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(ContactFetchSuccess(res?.data?.contactList ?? []));
      else
        emit(
          ContactFetchFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        ContactFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onContactSelectionSubmitted(
    ContactSelectionSubmitted event,
    Emitter<ContactSelectionState> emit,
  ) async {
    emit(ContactSelectionInProgress());
    final dataState = await contactSelectionUseCase(
      params: ContactSelectionRequestParams(contactInfo: event.contactInfo),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(ContactSelectionSuccess());
      else
        emit(
          ContactSelectionFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        ContactSelectionFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onContactNoSelectionSubmitted(
    ContactNoSelectionSubmitted event,
    Emitter<ContactSelectionState> emit,
  ) async {
    emit(
      ContactSelectionFailure(
        ApiError(errorMessage: 'Please select a contact'),
      ),
    );
  }
}
