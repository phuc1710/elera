part of 'pin_entry_bloc.dart';

abstract class PinEntryState {
  PinEntryState();
}

class PinSendingInitial extends PinEntryState {
  PinSendingInitial();
}

class PinSendingInProgress extends PinEntryState {
  PinSendingInProgress();
}

class PinSendingSuccess extends PinEntryState {
  PinSendingSuccess();
}

class PinSendingFailure extends PinEntryState {
  PinSendingFailure(this.error);

  final ApiError error;
}

class PinEntryInitial extends PinEntryState {
  PinEntryInitial();
}

class PinEntryInProgress extends PinEntryState {
  PinEntryInProgress();
}

class PinEntrySuccess extends PinEntryState {
  PinEntrySuccess();
}

class PinEntryFailure extends PinEntryState {
  PinEntryFailure(this.error);

  final ApiError error;
}
