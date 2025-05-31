import 'package:flutter/material.dart';

class EscutasPage extends StatefulWidget {
  const EscutasPage({super.key});

  @override
  State<EscutasPage> createState() => _EscutasPageState();
}

class _EscutasPageState extends State<EscutasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("a"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('a', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
