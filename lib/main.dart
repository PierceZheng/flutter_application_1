import 'package:flutter/material.dart';
import 'package:flutter_application_1/topo_sort.dart';

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
    // // 测试数据
    // Map<int, Node> graph = {
    //   1: Node(1, {2: 1, 3: 4}),
    //   2: Node(2, {1: 1, 4: 2, 5: 3}),
    //   3: Node(3, {1: 4, 6: 2}),
    //   4: Node(4, {2: 2, 5: 1, 7: 5}),
    //   5: Node(5, {2: 3, 4: 1, 8: 4}),
    //   6: Node(6, {3: 2, 9: 3}),
    //   7: Node(7, {4: 5, 10: 2}),
    //   8: Node(8, {5: 4}),
    //   9: Node(9, {6: 3}),
    //   10: Node(10, {7: 2}),
    // };
    // int startNode = 1;

    // // 计算最短路径
    // Dijkstra dijkstra = Dijkstra(graph, startNode);
    // Map<int, int> shortestDistances = dijkstra.shortestPath();

    // // 打印结果
    // print("从节点 $startNode 到其他节点的最短距离：");
    // shortestDistances.forEach((node, distance) {
    //   print("节点 $node: $distance");
    // });

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
