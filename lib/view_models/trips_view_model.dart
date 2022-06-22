import 'package:redux/redux.dart';
import 'package:redux_state/models/trips_model.dart';
import 'package:redux_state/store/application_state.dart';
import 'package:redux_state/store/trips/actions.dart';

class HomeScreenViewModel {
  final Store<ApplicationState> _store;
  final bool isLoading;
  final List<TopDestination> users;
  final String? errorMessage;

  bool get hasAnyUsers => users.isNotEmpty;
  bool get hasError => errorMessage != null && users.isEmpty;

  HomeScreenViewModel(
    this._store,
    this.isLoading,
    this.users,
    this.errorMessage,
  );

  static HomeScreenViewModel converter(Store<ApplicationState> store) {
    return HomeScreenViewModel(
      store,
      store.state.tripsState.isLoading,
      store.state.tripsState.data.values.toList(),
      store.state.tripsState.errorMessage,
    );
  }

  void loadUsers() => _store.dispatch(LoadUsersAction());
}
