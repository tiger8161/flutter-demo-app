import 'package:flutter/material.dart';
import 'package:flutter_node_auth/view/home/filter_bar_class.dart';

class BodyContainerSection extends StatefulWidget {
  const BodyContainerSection({super.key});

  @override
  State<BodyContainerSection> createState() => _BodyContainerSectionState();
}

class _BodyContainerSectionState extends State<BodyContainerSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const FilterBarSection(),
        ),
        Container(
        ),
        Container(),
        Container(
        ),
        Container(),
      ],
    );
  }
}
