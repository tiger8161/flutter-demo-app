import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../establishment/establishment_class.dart';
import 'detail_card_class.dart';

class FilterBarSection extends StatefulWidget {
  const FilterBarSection({super.key});

  @override
  State<FilterBarSection> createState() => _FilterBarSectionState();
}

class BuildingType {
  final String? name;
  BuildingType({this.name});
}

List<BuildingType> buildingTypeList = [
  BuildingType(name: "Salon"),
  BuildingType(name: "Beauty Parlour"),
  BuildingType(name: "Hospital"),
  BuildingType(name: "Shop"),
];

class _FilterBarSectionState extends State<FilterBarSection> {
  List<BuildingType> selectedBuildingTypeList = [];

  void openFilterDialog() async {
    await FilterListDialog.display<BuildingType>(context,
        listData: buildingTypeList,
        selectedListData: selectedBuildingTypeList,
        choiceChipLabel: (buildingType) => buildingType!.name,
        validateSelectedItem: (list, val) => list!.contains(val),
        onItemSearch: (buildingType, query) {
          return buildingType.name!.toLowerCase().contains(query.toLowerCase());
        },
        onApplyButtonClick: (list) {
          setState(() {
            selectedBuildingTypeList = List.from(list!);
          });
          // Navigator.pop(context);
        });
  }

  void onChipTapped(BuildingType buildingType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(buildingType: buildingType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: openFilterDialog,
          child: const Text("Filter"),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
        ),
        Wrap(
          spacing: 8.0,
          children: selectedBuildingTypeList.map((buildingType) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () => onChipTapped(buildingType),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Chip(
                    label: Text(buildingType.name!),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class DetailPage extends StatefulWidget {
  final BuildingType buildingType;

  const DetailPage({super.key, required this.buildingType});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<dynamic> items = [];
  bool isLoading = true;
  List<String> imagePaths = [
    'assets/images/parlour/Esha_Khamo/1.jpg',
    'assets/images/parlour/Esha_Khamo/2.jpg',
    'assets/images/parlour/Esha_Khamo/3.jpg',
    'assets/images/parlour/Esha_Khamo/4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    fetchItemsFromServer();
  }

  Future<void> fetchItemsFromServer() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:4000/api/service/get_all'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          items = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } on HandshakeException catch (e) {
      print('HandshakeException: $e');
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.buildingType.name!),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const EstablishmentPage( rating: 4.7 ),
                      ),
                    );
                  },
                  child: DetailCard(
                    title: items[index]['name']!,
                    openTime: items[index]['open_time']!,
                    imagePaths: imagePaths,
                  ),
                );
              },
            ),
    );
  }
}
