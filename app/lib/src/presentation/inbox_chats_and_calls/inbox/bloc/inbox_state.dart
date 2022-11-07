part of 'inbox_bloc.dart';

@immutable
abstract class InboxState {}

class InboxInitial extends InboxState {}

class InboxFetchInProgress extends InboxState {}

class InboxFetchSuccess extends InboxState {
  InboxFetchSuccess(this.data);

  final Data? data;
}

class InboxFetchFailure extends InboxState {
  InboxFetchFailure(this.error);

  final ApiError? error;
}
