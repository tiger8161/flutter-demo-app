import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_node_auth/view/auth/sign_in_class.dart';
import 'package:http/http.dart' as http;

class SignUpSection extends StatefulWidget {
  const SignUpSection({super.key});

  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  var email = '';
  var password = '';
  var username = '';
  var address = '';

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
                  placeholder: "Email",
                  onChanged: (value) {
                    email = value;
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                  placeholder: "Address",
                  onChanged: (value) {
                    address = value;
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
                  signup(username, email, password, address,  context);
                },
                child: const Text("Sign Up")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInSection())
                  );
                },
                child: const Text("Log In")
            ),
          ],
        ),
      ),
    );
  }
}

signup(String username, String email, String password, String address, BuildContext context) async {
  var url = Uri.parse("http://127.0.0.1:4000/api/auth/signup");
  List<String> roles = ['user'];

  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'address': address,
      'roles': roles,
    }),
  );

  if (response.statusCode == 200) {
    print("success!");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInSection())
    );
  } else {
    throw Exception('Failed to create');
  }
}