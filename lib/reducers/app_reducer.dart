import '../actions/user_actions.dart';
import '../models/app_state.dart';

AppState appReducer (AppState state, dynamic action) {
  if (action is UserFetchedAction) {
    return state.copyWith(user: action.userData);
  } else if (action is UserFetchFailedAction) {

  }

  return state;
}