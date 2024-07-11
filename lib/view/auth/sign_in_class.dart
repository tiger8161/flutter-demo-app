import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_node_auth/view/auth/sign_up_class.dart';
import 'package:flutter_node_auth/view/home/home_class.dart';
import 'package:http/http.dart' as http;

class SignInSection extends StatefulWidget {
  const SignInSection({super.key});

  @override
  State<SignInSection> createState() => _SignInSectionState();
}

class _SignInSectionState extends State<SignInSection> {
  var email = '';
  var password = '';
  var username = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                  placeholder: "Username",
                  onChanged: (value) {
                    username = value;
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                  placeholder: "Password",
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  }
              ),
            ),
            TextButton(
                onPressed: () {
                  login(username, password, context);
                },
                child: const Text("Log In")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpSection())
                  );
                },
                child: const Text("Sign Up")
            ),
          ],
        ),
      ),
    );
  }
}

login(String username, String password, BuildContext context) async {
  var url = Uri.parse("http://127.0.0.1:4000/api/auth/signin");

  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print("success!");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeSection())
    );
  } else {
    throw Exception('Failed to log in');
  }
}