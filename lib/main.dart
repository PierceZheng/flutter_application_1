import 'package:flutter/material.dart';

import 'dijkstra.dart';

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
    // 测试数据
    Graph graph = Graph();

    final vertex1 = Vertex('1');
    final vertex2 = Vertex('2');
    final vertex3 = Vertex('3');
    final vertex4 = Vertex('4');
    final vertex5 = Vertex('5');
    final vertex6 = Vertex('6');
    final vertex7 = Vertex('7');
    final vertex8 = Vertex('8');
    final vertex9 = Vertex('9');

    final startVertex = vertex1;
    final endVertex = vertex9;

    graph.add(startVertex: vertex1, endVertex: vertex2, weight: 5);
    graph.add(startVertex: vertex1, endVertex: vertex3, weight: 2);
    graph.add(startVertex: vertex2, endVertex: vertex5, weight: 4);
    graph.add(startVertex: vertex2, endVertex: vertex6, weight: 2);
    graph.add(startVertex: vertex3, endVertex: vertex2, weight: 1);
    graph.add(startVertex: vertex3, endVertex: vertex4, weight: 3);
    graph.add(startVertex: vertex4, endVertex: vertex6, weight: 5);
    graph.add(startVertex: vertex4, endVertex: vertex8, weight: 9);
    graph.add(startVertex: vertex5, endVertex: vertex7, weight: 1);
    graph.add(startVertex: vertex6, endVertex: vertex9, weight: 4);
    graph.add(startVertex: vertex7, endVertex: vertex9, weight: 2);
    graph.add(startVertex: vertex8, endVertex: vertex9, weight: 1);

    print(graph.dijkstra(startVertex, endVertex));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
