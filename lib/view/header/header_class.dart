import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../profile/profile_class.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(3.0),
            decoration: avatarDecoration,
            child: Container(
              decoration: avatarDecoration,
              padding: const EdgeInsets.all(3),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/image.jpeg'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(3.0),
            decoration: avatarDecoration,
            child: Container(
              decoration: avatarDecoration,
              padding: const EdgeInsets.all(3),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileSection()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
