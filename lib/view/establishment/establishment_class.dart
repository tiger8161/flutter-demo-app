import 'package:flutter/material.dart';

class EstablishmentPage extends StatelessWidget {
  final double rating;
  const EstablishmentPage({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Establishment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text("Barberen i Vognmagergade"),
                        Text("Detail"),
                        Text("Location"),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        if (index < fullStars) {
                          return const Icon(Icons.star, color: Colors.red);
                        } else if (index == fullStars && hasHalfStar) {
                          return const Icon(Icons.star_half, color: Colors.red);
                        } else {
                          return const Icon(Icons.star_border,
                              color: Colors.red);
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
