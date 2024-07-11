import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../actions/user_actions.dart';
import '../../models/app_state.dart';
import '../../utils/constant.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: StoreConnector<AppState, Map<String, dynamic>>(
        converter: (store) => store.state.user,
        builder: (context, user) {
          if (user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  left: 50.0,
                                  right: 50.0,
                                  bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '${user['username']}',
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 120,
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: avatarDecoration,
                                    child: Container(
                                      decoration: avatarDecoration,
                                      padding: const EdgeInsets.all(3.0),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/user.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: InkWell(
                                  // onTap: () {},
                                  child: Text(
                                    'Payments',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: InkWell(
                                  // onTap: () {},
                                  child: Text(
                                    'Settings',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: InkWell(
                                  // onTap: () {},
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: InkWell(
                                  // onTap: () {},
                                  child: Text(
                                    'Support',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: InkWell(
                                  // onTap: () {},
                                  child: Text(
                                    'Bookings',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: InkWell(
                                  // onTap: () {},
                                  child: Text(
                                    'Saved Time',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: InkWell(
                                  // onTap: () {},
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(FetchUserAction(1));
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
