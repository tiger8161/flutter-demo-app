import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final List<String> imagePaths;
  final List<dynamic> openTime;

  const DetailCard({super.key, required this.title, required this.imagePaths, required this.openTime});

  Future<void> _preloadImages(BuildContext context, List<String> paths) async {
    for (String path in paths) {
      await precacheImage(AssetImage(path), context);
    }
  }

  String getTimesForToday() {
    DateTime today = DateTime.now();
    int day = today.weekday;
    String result = openTime[day - 1];
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final String time = getTimesForToday();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: _preloadImages(context, imagePaths),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CarouselSlider(
                      options: CarouselOptions(height: 200, autoPlay: false),
                      items: imagePaths.map((path) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              path,
                              fit: BoxFit.cover,
                              width: 300,
                            );
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              width: 300,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(title, style: const TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(time, style: const TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
