import 'package:flutter/material.dart';
import 'package:flutter_application_1/topo_sort.dart';

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
    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(2, 4);
    graph.addEdge(2, 5);
    graph.addEdge(3, 6);
    graph.addEdge(4, 7);
    graph.addEdge(5, 8);
    graph.addEdge(6, 9);
    graph.addEdge(9, 0);

    //Kahn和 DFS 两个算法得到的结果是不一样的，但是这两个结果都是符合要求的。
    // 生成一个节点的线性序列
    // 对于图中的每条边 (u, v)，节点 u 在序列中都出现在节点 v 之前
    // 其中，节点 u->v，就是 u 到 v
    // 打印出来的结果不一样？？？！！！吓老子一跳
    print('${graph.topoSortKahn()}');
    print('${graph.topSortDFS()}');

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
