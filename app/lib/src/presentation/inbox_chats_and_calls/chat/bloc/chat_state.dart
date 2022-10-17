part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatFetchInProgress extends ChatState {}

class ChatFetchSuccess extends ChatState {
  ChatFetchSuccess(this.data);

  final Data? data;
}

class ChatFetchFailure extends ChatState {
  ChatFetchFailure(this.error);

  final ApiError? error;
}
