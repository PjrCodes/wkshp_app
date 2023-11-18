import 'package:flutter/material.dart';

// the main function, called when the app is run.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp({super.key}); // A constructor, we can ignore this for now.

  @override
  Widget build(BuildContext context) {
    // the build function returns what is shown on screen.

    return const MaterialApp( // An app with the "Material" UI design scheme.
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Stateful widgets are widgets that can change over time.

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    // A simple app with a purple app bar and a centered text.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 41, 60),
        title: const Text("Birthday Card Generator"),
      ),
      body: const Center(
        child: Text("Hello World!"),
      ), // The comma at the end makes everything look nicer.
    );
  }
}
