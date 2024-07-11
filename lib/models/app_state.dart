class AppState {
  final Map<String, dynamic> user;

  AppState({ this.user = const {} });

  AppState copyWith({ Map<String, dynamic>? user }) {
    return AppState(user: user ?? this.user);
  }
}