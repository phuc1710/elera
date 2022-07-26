part of 'notification_bloc.dart';

abstract class NotificationState {
  const NotificationState();
}

class NotificationFetchInitial extends NotificationState {
  NotificationFetchInitial();
}

class NotificationFetchInProgress extends NotificationState {
  NotificationFetchInProgress();
}

class NotificationFetchSuccess extends NotificationState {
  NotificationFetchSuccess(this.data);

  final Data? data;
}

class NotificationFetchFailure extends NotificationState {
  NotificationFetchFailure(this.error);

  final ApiError error;
}
