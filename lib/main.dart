import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[400],
        appBar: AppBar(
          title: Center(
              child: Text(
            'DiceRoll',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.orange[400],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void diceNumChange() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170.0,
        ),
        Row(
          children: [
            Expanded(
                child: TextButton(
                    onPressed: () {
                      diceNumChange();
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'))),
            Expanded(
                child: TextButton(
              onPressed: () {
                diceNumChange();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ))
          ],
        ),
        SizedBox(
          height: 50.0,
        ),
        ElevatedButton(
          onPressed: () {
            diceNumChange();
          },
          style: ElevatedButton.styleFrom(
              elevation: 12, textStyle: const TextStyle(color: Colors.white, fontSize: 30), foregroundColor: Colors.white, backgroundColor: Colors.orange[700]),
          child: Text('Press to Roll'),
        ),
      ],
    );
  }
}
