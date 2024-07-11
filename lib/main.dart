import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'middleware/user_middleware.dart';
import 'models/app_state.dart';
import 'reducers/app_reducer.dart';
import 'view/auth/sign_in_class.dart';

void main() {
  final store = Store<AppState>(
    appReducer, 
    initialState: AppState(),
    middleware: [userMiddleware],
  );

  runApp(
    StoreProvider<AppState>(
      store: store, 
      child: const MaterialApp(
        home: MyApp(),
      )
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInSection(),
    );
  }
}