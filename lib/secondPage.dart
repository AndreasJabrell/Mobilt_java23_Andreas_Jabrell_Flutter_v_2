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
      body: Center(
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
             'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjHJ5BB8Ex6dmUiZn8daexIFdqQ7ouG75kuYgTHyI9AGDrXVfdDyVn6BULOYkFIiyg1uHFH-v_Qogxa6Q53Ap7PyBuZLePZf6UkqAA4jzBHSgBPmyT8XafM24MvcXGrvDhRuIPECVnRxQXB/s400/harry+p.gif',
             errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error); // Placeholder for error handling
          }),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Kolla en ruta!'),
              ),
            ),

                     ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
