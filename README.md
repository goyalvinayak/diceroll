# DiceRoll
The "DiceRoll" project is a fun Flutter application where users can roll two dice by tapping a button.

![dice1](https://github.com/user-attachments/assets/c6f08c12-67b2-40f0-b00d-95f93f884ad8)
![dice2](https://github.com/user-attachments/assets/25705b29-0a9e-44cf-b295-e15cb2503e26)

## Project Overview
The app consists of:
- Two dice images that change randomly when tapped.
- A button (or gesture) to trigger the dice roll.
- A simple UI layout using Row and Expanded widgets.

### Key Learning Outcomes
1. Stateful Widgets (StatefulWidget)
- Understanding how widgets can change dynamically.
- Using **setState()** to update the UI.

2. Random Number Generation
- Using the **dart:math** library to generate random numbers for dice rolls.
3. Flutter Layout & UI Design
- Using Row, Expanded, and Image widgets.

## App Icon
- Using **flutter_launch_icon** package
```
flutter_launcher_icons:
    android: "launcher_icon"
    image_path: "assets/icons/icon.png"
    min_sdk_android: 21
```
![opening](https://github.com/user-attachments/assets/79259831-f0ec-4d72-979c-69abc79b1c1e)

## Code
```
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
```


