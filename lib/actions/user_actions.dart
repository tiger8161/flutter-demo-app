class FetchUserAction {
  final int userId;

  FetchUserAction(this.userId);
}

class UserFetchedAction {
  final Map<String, dynamic> userData;

  UserFetchedAction(this.userData);
}

class UserFetchFailedAction {
  final String error;

  UserFetchFailedAction(this.error);
}