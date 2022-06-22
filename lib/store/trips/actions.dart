import '../../models/trips_model.dart';

abstract class TripsAction {}

class LoadUsersAction implements TripsAction {
  @override
  String toString() => "$LoadUsersAction";
}

class LoadUsersSucceededAction implements TripsAction {
  final List<TopDestination> users;

  LoadUsersSucceededAction(this.users);

  @override
  String toString() => "$LoadUsersSucceededAction";
}

class LoadUsersFailedAction implements TripsAction {
  final String error;

  LoadUsersFailedAction(this.error);

  @override
  String toString() => "$LoadUsersFailedAction($error)";
}
