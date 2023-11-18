import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class CardPage extends StatelessWidget {
  CardPage({super.key, required this.name, required this.birthDay});

  final String name;
  final DateTime birthDay;

  final GlobalKey genKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    var myWidth = MediaQuery.of(context).size.width - 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: const Text("Birthday Card Generator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: RepaintBoundary(
                key: genKey,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/card.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                      height: myWidth,
                      width: myWidth,
                    ),
                    Positioned(
                      top: myWidth - 100,
                      left: 0,
                      child: SizedBox(
                        height: 100,
                        width: myWidth,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(220, 255, 192, 203)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: myWidth - 100,
                      left: 15,
                      child: Text(
                        "Happy Birthday",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.pink.shade600,
                        ),
                      ),
                    ),
                    Positioned(
                      top: myWidth - 80,
                      left: 15,
                      child: SizedBox(
                        width: 360,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.pink.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: myWidth - 50,
                      left: 15,
                      child: Text(
                        'You turn ${DateTime.now().difference(birthDay).inDays ~/ 365} years old today!',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.pink.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text("Share Card"),
              onPressed: () async {
                // share the card by exporting the repaint to image
                // and share it to other apps

                // get the render object from the key
                RenderRepaintBoundary? boundary = genKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
                if (boundary == null) {
                  return;
                }
                // convert to image
                ui.Image image = await boundary.toImage(pixelRatio: 4.0); // 4.0x the scale!
                ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                Uint8List pngBytes = byteData!.buffer.asUint8List();

                Directory tempDir = await getTemporaryDirectory();
                File file = File('${tempDir.path}/image.png');
                await file.writeAsBytes(pngBytes);

                await Share.shareXFiles([XFile("${tempDir.path}/image.png")]);

              },
            ),
          ],
        ),
      ),
    );
  }
}
