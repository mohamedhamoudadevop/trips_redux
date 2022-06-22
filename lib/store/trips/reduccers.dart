import 'package:redux/redux.dart';
import 'package:redux_state/models/trips_model.dart';
import 'package:redux_state/store/application_state.dart';
import 'package:redux_state/store/trips/actions.dart';

final usersReducer = combineReducers<DataState<TopDestination>>([
  TypedReducer<DataState<TopDestination>, LoadUsersAction>(onUsersLoading),
  TypedReducer<DataState<TopDestination>, LoadUsersSucceededAction>(
      onUsersLoaded),
  TypedReducer<DataState<TopDestination>, LoadUsersFailedAction>(
      onUsersLoadFailure),
]);

DataState<TopDestination> onUsersLoading(
  DataState<TopDestination> state,
  LoadUsersAction action,
) {
  return state.copyWith(isLoading: true);
}

DataState<TopDestination> onUsersLoaded(
  DataState<TopDestination> state,
  LoadUsersSucceededAction action,
) {
  final users = Map<int, TopDestination>.from(state.data);

  for (final user in action.users) {
    users[user.id!] = user;
  }

  return state.copyWith(
    isLoading: false,
    data: users,
  );
}

DataState<TopDestination> onUsersLoadFailure(
  DataState<TopDestination> state,
  LoadUsersFailedAction action,
) {
  return state.copyWith(isLoading: false, errorMessage: action.error);
}
