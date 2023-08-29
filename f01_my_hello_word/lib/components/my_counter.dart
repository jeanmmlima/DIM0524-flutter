import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({Key? key}) : super(key: key);

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int count = 0;

  contar() {
    setState(() {
      count++;
    });

    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Contando: $count",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: contar,
            child: Text("Contar"),
          ),
        ],
      ),
    );
  }
}
