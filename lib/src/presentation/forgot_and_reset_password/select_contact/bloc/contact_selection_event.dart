part of 'contact_selection_bloc.dart';

abstract class ContactSelectionEvent {
  const ContactSelectionEvent();
}

class ContactFetched extends ContactSelectionEvent {
  const ContactFetched({required this.userEmail});

  final String userEmail;
}

class ContactSelectionSubmitted extends ContactSelectionEvent {
  const ContactSelectionSubmitted({required this.contactInfo});

  final dynamic contactInfo;
}

class ContactNoSelectionSubmitted extends ContactSelectionEvent {
  const ContactNoSelectionSubmitted();
}
