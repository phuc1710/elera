part of 'fill_your_profile_bloc.dart';

abstract class FillYourProfileEvent {
  const FillYourProfileEvent();
}

class FillYourProfileSubmitted extends FillYourProfileEvent {
  const FillYourProfileSubmitted({
    required this.fullName,
    required this.nickname,
    required this.dateOfBirth,
    required this.email,
    required this.phoneNumber,
    required this.gender,
  });

  final String fullName;
  final String nickname;
  final String dateOfBirth;
  final String email;
  final String phoneNumber;
  final String gender;
}
