part of 'pin_entry_bloc.dart';

abstract class PinEntryEvent {
  const PinEntryEvent();
}

class PinSendingRequested extends PinEntryEvent {
  const PinSendingRequested(this.contactInfo);

  final String? contactInfo;
}

class PinEntrySubmitted extends PinEntryEvent {
  const PinEntrySubmitted(this.pin);

  final String? pin;
}
