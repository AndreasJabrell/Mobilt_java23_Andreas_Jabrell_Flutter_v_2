import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_v4/harryPotter.dart';
import 'package:flutter_v4/secondPage.dart';
import 'package:flutter_v4/thirdPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //routing för de olika sidorna
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "Home"),
        '/second': (context) => const secondPage(title: "SecondPage"),
        '/third': (context) => MyHomePage2(
          title: "Harry Potter Books",
          books: fetchHarryPotter(), // API-anropet
        ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
  
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Vart vill gå gå?'),

            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text("Go to second page"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text("Go to third page"),
            ),
          ],
        ),
      ),
    );
  }
}

// fetch-funktion för API
Future<List<HarryPotter>> fetchHarryPotter() async {

  final response = await http.get(Uri.parse('https://potterapi-fedeperin.vercel.app/en/books/'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => HarryPotter.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Harry Potter books');
  }
}

