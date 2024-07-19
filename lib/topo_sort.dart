import 'dart:collection';

import 'package:flutter/material.dart';

base class IntegerEntry with LinkedListEntry<IntegerEntry> {
  IntegerEntry(this.value);

  int value;
}

class Graph {
  final int _v; // 顶点个数
  final List<LinkedList<IntegerEntry>> _adj = []; // 邻接表

  Graph(this._v) {
    for (int i = 0; i < _v; i++) {
      _adj.add(LinkedList());
    }
  }

  void addEdge(int s, int t) {
    final linkedList = _adj[s];
    final entry = IntegerEntry(t);
    if (linkedList.isEmpty) {
      linkedList.addFirst(entry);
    } else {
      linkedList.add(entry);
    }
  }

  List<int> topoSortKahn() {
    final inDegree = List.filled(_v, 0);
    final queue = Queue<int>();

    for (final linkedList in _adj) {
      for (final entry in linkedList) {
        inDegree[entry.value]++;
      }
    }

    for (int i = 0; i < inDegree.length; i++) {
      if (inDegree[i] == 0) {
        queue.add(i);
        inDegree[i] = -1;
      }
    }

    final List<int> result = [];
    while (queue.isNotEmpty) {
      final firstValue = queue.removeFirst();
      result.add(firstValue);
      for (final entry in _adj[firstValue]) {
        inDegree[entry.value]--;
      }

      for (int i = 0; i < inDegree.length; i++) {
        if (inDegree[i] == 0) {
          queue.add(i);
          inDegree[i] = -1;
        }
      }
    }

    return result;
  }
}

class GraphWidget extends StatelessWidget {
  const GraphWidget(this.graph, {super.key});

  final Graph graph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("邻接表图"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < graph._v; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Text("顶点 $i: "),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: graph._adj[i].length,
                            itemBuilder: (context, index) {
                              final entry = graph._adj[i].elementAt(index);
                              return Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text("${entry.value}"),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
