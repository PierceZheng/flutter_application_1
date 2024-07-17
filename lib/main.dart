import 'package:flutter/material.dart';
import 'package:flutter_application_1/eight_queens.dart';

import 'package_0_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    final knapsack1 = Knapsack1(
      100,
      [
        Item1(1, 14, 22),
        Item1(2, 11, 20),
        Item1(3, 12, 21),
        Item1(4, 17, 30),
        Item1(5, 12, 22),
        Item1(6, 19, 35),
        Item1(7, 9, 14),
        Item1(8, 20, 54),
        Item1(9, 7, 19),
        Item1(10, 12, 25),
        Item1(11, 17, 31),
        Item1(12, 12, 21),
        Item1(13, 19, 31),
        Item1(14, 14, 25),
        Item1(15, 11, 22),
        Item1(16, 12, 29),
      ],
    );
    // knapsack1.solve();
    final result = knapsack1.latestSolveResult;

    print('$result');
  }

  @override
  Widget build(BuildContext context) {
    EightQueens eightQueens = EightQueens();
    eightQueens.cal8Queens(0);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Padding(
          padding: MediaQuery.paddingOf(context) + const EdgeInsets.all(16),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: eightQueens.resultWidget,
          ),
        ),
      ),
    );
  }
}
