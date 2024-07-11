import 'package:flutter/material.dart';

Color kAppPrimaryColor = Colors.grey.shade200;
Color kWhite = Colors.white;

BoxDecoration avatarDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: kAppPrimaryColor,
    boxShadow: [
      BoxShadow(
        color: kWhite,
        offset: const Offset(10, 10),
        blurRadius: 10,
      ),
      BoxShadow(
        color: kWhite,
        offset: const Offset(-10, -10),
        blurRadius: 10,
      ),
    ]
);