import 'package:flutter/material.dart';
import 'package:flutter_node_auth/view/footer/footer_class.dart';
import 'package:flutter_node_auth/view/header/header_class.dart';
import 'package:flutter_node_auth/view/home/body_container_class.dart';
import 'package:flutter_node_auth/view/home/search_bar_class.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Header Container
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              alignment: Alignment.center,
              child: const HeaderSection(),
            ),
            //Body Container
            Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: const SearchBarSection(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const BodyContainerSection(),
                      ),
                    ],
                  ),
                ),
            ),
            //Footer Container
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              alignment: Alignment.center,
              child: const FooterSection(),
            ),
          ],
        ),
      ),
    );
  }
}
