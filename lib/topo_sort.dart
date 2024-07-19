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
      _adj.add(LinkedList<IntegerEntry>());
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

  List<LinkedList<IntegerEntry>> get _inverseAdj {
    final List<LinkedList<IntegerEntry>> inverseAdj = [];

    for (int i = 0; i < _v; i++) {
      inverseAdj.add(LinkedList<IntegerEntry>());
    }

    for (int i = 0; i < _adj.length; i++) {
      final linkedList = _adj[i];
      for (final entry in linkedList) {
        final inverseLinkedList = inverseAdj[entry.value];
        final inverseEntry = IntegerEntry(i);
        if (inverseLinkedList.isEmpty) {
          inverseLinkedList.addFirst(inverseEntry);
        } else {
          inverseLinkedList.add(inverseEntry);
        }
      }
    }

    return inverseAdj;
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

  List<int> topSortDFS() {
    final List<LinkedList<IntegerEntry>> inverseAdj = _inverseAdj;
    final List<bool> visited = List.filled(inverseAdj.length, false);
    final List<int> result = [];

    for (int i = 0; i < inverseAdj.length; i++) {
      if (!visited[i]) {
        visited[i] = true;
        result.addAll(dfs(i, inverseAdj, visited));
      }
    }
    return result;
  }

  List<int> dfs(int vertex, List<LinkedList<IntegerEntry>> inverseAdj, List<bool> visited) {
    final inverseLinkedList = inverseAdj[vertex];
    final List<int> result = [];
    for (final entry in inverseLinkedList) {
      final i = entry.value;
      if (visited[i]) continue;
      visited[i] = true;
      result.addAll(dfs(i, inverseAdj, visited));
    }
    result.add(vertex);
    return result;
  }
}

class GraphWidget extends StatelessWidget {
  const GraphWidget(this.graph, {super.key});

  final Graph graph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("邻接表图"),
              ..._buildLinkedLists(graph._adj),
              const Text("逆邻接表图"),
              ..._buildLinkedLists(graph._inverseAdj),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLinkedLists(List<LinkedList<IntegerEntry>> adj) {
    final List<Widget> children = [];
    for (int i = 0; i < adj.length; i++) {
      children.add(Padding(
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
                  itemCount: adj[i].length,
                  itemBuilder: (context, index) {
                    final entry = adj[i].elementAt(index);
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
      ));
    }
    return children;
  }
}
