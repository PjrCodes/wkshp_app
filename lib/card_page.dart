// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  CardPage({super.key, required this.name, required this.birthDay});

  final DateTime birthDay;
  final String name;

  final GlobalKey genKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var myWidth = MediaQuery.of(context).size.width - 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Text("Birthday Card Generator"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: RepaintBoundary(
                key: genKey,
                child: Stack(
                  children: [],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text("Share Card"),
              onPressed: ()  {},
            ),
          ],
        ),
      ),
    );
  }
}
