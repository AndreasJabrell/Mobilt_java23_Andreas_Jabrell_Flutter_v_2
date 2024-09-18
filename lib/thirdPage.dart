import 'package:flutter/material.dart';

import 'harryPotter.dart';
import 'harryPotterList.dart';

class MyHomePage2 extends StatelessWidget {
  final String title;
  final Future<List<HarryPotter>> books;

  MyHomePage2({required this.title, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCBC3E3),
        title: Text("Harry Potter"),
      ),
      body: Center(
        child: FutureBuilder<List<HarryPotter>>(
          future: books,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }

            // kollar så att data inte är null, skicas sen vidare
            return snapshot.hasData
                ? HarryPotterList(items: snapshot.data ?? [])
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

//referens för api hämtande och uppbyggnad https://www.geeksforgeeks.org/implementing-rest-api-in-flutter/