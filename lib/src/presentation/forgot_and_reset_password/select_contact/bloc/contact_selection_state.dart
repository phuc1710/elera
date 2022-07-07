part of 'contact_selection_bloc.dart';

abstract class ContactSelectionState {
  ContactSelectionState();
}

class ContactFetchInitial extends ContactSelectionState {
  ContactFetchInitial();
}

class ContactFetchInProgress extends ContactSelectionState {
  ContactFetchInProgress();
}

class ContactFetchSuccess extends ContactSelectionState {
  ContactFetchSuccess(this.contacts);

  final List<ContactModel?> contacts;
}

class ContactFetchFailure extends ContactSelectionState {
  ContactFetchFailure(this.error);

  final ApiError error;
}

class ContactSelectionInitial extends ContactSelectionState {
  ContactSelectionInitial();
}

class ContactSelectionInProgress extends ContactSelectionState {
  ContactSelectionInProgress();
}

class ContactSelectionSuccess extends ContactSelectionState {
  ContactSelectionSuccess();
}

class ContactSelectionFailure extends ContactSelectionState {
  ContactSelectionFailure(this.error);

  final ApiError error;
}
