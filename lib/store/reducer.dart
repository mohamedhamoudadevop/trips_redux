import 'package:redux_state/store/application_state.dart';
import 'package:redux_state/store/trips/reduccers.dart';

ApplicationState reducer(ApplicationState state, action) {
  return ApplicationState(
    usersReducer(state.tripsState, action),
  );
}
