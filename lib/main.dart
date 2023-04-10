import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _amount = 0;

  String _getAmountInfo() {
    final num squared = pow(_amount, 1 / 2);
    final num triangular = pow(_amount, 1 / 3);

    if (squared.remainder(1) == 0 && triangular.remainder(1) == 0) {
      return 'This number is both SQUARE and TRIANGULAR';
    }

    if (squared.remainder(1) == 0) {
      return 'This number is SQUARE';
    }

    if (triangular.remainder(1) == 0) {
      return 'This number is TRIANGULAR';
    }

    return 'This number is neither SQUARE or TRIANGULAR';
  }

  void _showAlertDialog(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      title: Text(
        _amount.toString(),
        style: const TextStyle(
          fontSize: 35,
        ),
      ),
      content: Text(
        _getAmountInfo(),
        style: const TextStyle(
          fontSize: 35,
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Number Shapes')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 15),
          child: Column(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              const Text(
                'Insert a number to see if it is a square or triangular',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  hintText: 'number',
                ),
                style: const TextStyle(
                  fontSize: 30,
                ),
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    _amount = int.parse(value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAlertDialog(context),
        tooltip: 'Verify',
        child: const Icon(Icons.check),
      ),
    );
  }
}
