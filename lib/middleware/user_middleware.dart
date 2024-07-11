import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:redux/redux.dart';
import '../models/app_state.dart';
import '../actions/user_actions.dart';

void userMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
  if (action is FetchUserAction) {
    try {
      final response = await http.get(Uri.parse('http://localhost:4000/api/user?id=${action.userId}'));
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        store.dispatch(UserFetchedAction(userData));
      } else {
        store.dispatch(UserFetchFailedAction('Failed to fetch user data'));
      }
    } catch (e) {
      store.dispatch(UserFetchFailedAction(e.toString()));
    }
  }
  next(action);
}