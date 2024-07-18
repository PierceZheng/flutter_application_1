import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_distance.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    print('==========${'baab'.compultLWSTDistance_2('baaccbb')}');
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
