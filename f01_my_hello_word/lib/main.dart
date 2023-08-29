import 'package:f01_my_hello_word/components/my_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Primeiro App"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Olá, mundo!",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Esse é o meu primeiro app em Flutter!",
                  style: TextStyle(fontSize: 14),
                ),
                MyCounter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
