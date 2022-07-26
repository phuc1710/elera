part of 'create_new_pin_bloc.dart';

abstract class CreateNewPinEvent {
  const CreateNewPinEvent();
}

class CreateNewPinSubmitted extends CreateNewPinEvent {
  const CreateNewPinSubmitted({required this.pinCode});

  final String pinCode;
}
