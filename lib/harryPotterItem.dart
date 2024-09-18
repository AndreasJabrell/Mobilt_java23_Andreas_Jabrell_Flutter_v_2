import 'package:flutter/material.dart';
import 'harryPotter.dart';

class HarryPotterItem extends StatelessWidget {
  HarryPotterItem({required this.item});

  final HarryPotter item;
    //tar emot ett harry potter objekt och skapar ett kort med dess innehåll. Kör så läng som listan med objekt är
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              item.cover,
              width: 200,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error); // Placeholder for error handling
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item.originalTitle,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Description: ${item.description}"),
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
