import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_distance.dart';
import 'package:flutter_application_1/eight_queens.dart';
import 'package:flutter_application_1/topo_sort.dart';

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
    final graph = Graph(10);
    graph.addEdge(0, 1);
    graph.addEdge(0, 5);
    graph.addEdge(0, 2);
    graph.addEdge(1, 3);
    graph.addEdge(2, 4);
    graph.addEdge(2, 5);
    graph.addEdge(3, 6);
    graph.addEdge(4, 7);
    graph.addEdge(5, 8);
    graph.addEdge(6, 9);

    print('${graph.topoSortKahn()}');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: GraphWidget(graph),
      ),
    );
  }
}
