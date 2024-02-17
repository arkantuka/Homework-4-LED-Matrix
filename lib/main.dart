import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LED Matrix',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[200],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Homework 4 : LED Matrix')),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [1, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(-1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDisplay(value),
            ],
          ),
          _buildButton(-2),
        ],
      ),
    );
  }

  Widget _buildDot(int value) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: value == 1
            ? Color.fromARGB(255, 255, 94, 0)
            : Color.fromARGB(255, 44, 44, 44),
        shape: BoxShape.circle,
        border:
            Border.all(width: 0.5, color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }

  Widget _buildRow(List<int> dotList) {
    return Row(
      children: dotList.map((int dot) => _buildDot(dot)).toList(),
    );
  }

  Widget _buildDigit(List<List<int>> rowList) {
    return Column(
      children: rowList.map((List<int> row) => _buildRow(row)).toList(),
    );
  }

  Widget _buildDisplay(int updateValue) {
    return Container(
      width: 250,
      height: 175,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          border: Border.all(
            width: 5.0,
            color: Color.fromARGB(255, 255, 255, 255),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDigit(HomePage.dotsData[updateValue ~/ 10]),
              _buildDigit(HomePage.dotsData[updateValue % 10]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(int num) {
    return InkWell(
      onTap: () {
        setState(
          () {
            num == -1 ? value = value + 1 : value = value - 1;
            if (value > 99) value = 0;
            if (value < 0) value = 99;
          },
        );
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (num == -1) Icon(Icons.arrow_drop_up),
              if (num == -2) Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
