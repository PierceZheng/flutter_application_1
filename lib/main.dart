import 'package:flutter/material.dart';
import 'package:flutter_application_1/eight_queens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
