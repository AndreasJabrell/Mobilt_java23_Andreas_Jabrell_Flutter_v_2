import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key, required this.title});
  final String title;


  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Gå till sida tre istället, mycket roligare')));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Här händer det inte mycket',
            ),
            FilledButton(onPressed: ()=> {
              Navigator.pushNamed(context, '/')
            }, child: Text("Back to HOME page")),

            Image.network(
             'https://cdn.prod.website-files.com/5d2b950d9ea87fc61f0c1f3e/5daa028e7721ae5d74817a68_dqLNOFNwqI5qonP2gsu1hsZC3zS4fwTtYuHidjGxrbFHesRCUqI6jmPjhTUqVX-OUL60EjwGQIO-V-qSo29hnCDrMn1yDjYkGg5Mgh1av4NzJWSCeSHwVD0NQERjmJ7E1T5yXymM.gif',
             errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error); // Placeholder for error handling
          }),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Kolla en ruta, absolut meningslös men extra padding!'),
              ),
            ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
