part of 'new_card_bloc.dart';

abstract class NewCardEvent extends Equatable {
  const NewCardEvent();

  @override
  List<Object?> get props => [];
}

class NewCardAdded extends NewCardEvent {
  const NewCardAdded(this.params);

  final NewCardParams params;

  @override
  List<Object?> get props => [params];
}
