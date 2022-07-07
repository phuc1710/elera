part of 'new_card_bloc.dart';

abstract class NewCardState extends Equatable {
  const NewCardState();

  @override
  List<Object?> get props => [];
}

class NewCardInitial extends NewCardState {}

class NewCardInProgress extends NewCardState {}

class NewCardFailure extends NewCardState {
  const NewCardFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class NewCardAddSuccess extends NewCardState {
  const NewCardAddSuccess({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}
