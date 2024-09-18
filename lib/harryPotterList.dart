import 'package:flutter/material.dart';
import 'harryPotter.dart';

class HarryPotterList extends StatelessWidget {
  final List<HarryPotter> items;

  HarryPotterList({required this.items});
    //tar emot objekt från item (ett färdigt card) och sätter ihop i en lista som displayas
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        //bygger list widget med alla cards
        final harryPotter = items[index];

        return ListTile(
          leading: Image.network(harryPotter.cover),  // Bild från API:t
          title: Text(harryPotter.originalTitle),     // Visa originalTitle
          subtitle: Text(harryPotter.description),    // Visa description
        );
      },
    );
  }
}