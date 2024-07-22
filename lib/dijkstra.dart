/// 顶点
class Vertex {
  Vertex(this.id);
  factory Vertex.empty() => Vertex('-1');

  final String id;
  @override
  String toString() {
    return 'id:$id';
  }
}

/// 边
class Edge {
  Edge(this.start, this.end, this.weight);

  final Vertex start;
  final Vertex end;
  final double weight;
}

/// 图
class Graph {
  final Map<Vertex, List<Edge>> _adjacencyTable = {};

  void add({
    required Vertex startVertex,
    required Vertex endVertex,
    required double weight,
  }) {
    final edge = Edge(startVertex, endVertex, weight);
    final edgeList = _adjacencyTable[startVertex] ?? [];
    edgeList.add(edge);
    _adjacencyTable[startVertex] = edgeList;
    if (_adjacencyTable[endVertex] == null) {
      _adjacencyTable[endVertex] = [];
    }
  }

  List<Vertex> dijkstra(Vertex startVertex, Vertex endVertex) {
    final Map<Vertex, Vertex> predecessor = {}; // 回溯最短路径
    final queue = PriorityQueue(_adjacencyTable.length);
    final Map<Vertex, double> weightCache = {};
    final Set<Vertex> visited = {};

    for (final key in _adjacencyTable.keys) {
      weightCache[key] = double.maxFinite;
    }
    weightCache[startVertex] = 0;
    queue.add(startVertex, 0);
    visited.add(startVertex);

    while (!queue.isEmpty) {
      final currentVertex = queue.poll();
      if (currentVertex == null) break;
      final currentWeight = weightCache[currentVertex] ?? 0;
      final currentEdges = _adjacencyTable[currentVertex] ?? [];

      for (final Edge edge in currentEdges) {
        final newWeight = currentWeight + edge.weight;
        final toVertex = edge.end;
        final cache = weightCache[toVertex] ?? 0;
        if (newWeight < cache) {
          weightCache[toVertex] = newWeight;
          predecessor[toVertex] = currentVertex;

          if (!visited.contains(edge.end)) {
            queue.add(toVertex, newWeight);
            visited.add(toVertex);
          } else {
            queue.update(toVertex, newWeight);
          }
        }
      }
    }

    final List<Vertex> result = [];
    Vertex? currentVertex = endVertex;
    while (currentVertex != null) {
      result.insert(0, currentVertex);
      currentVertex = predecessor[currentVertex];
    }

    return result;
  }
}

class WeightFromStartVertex {
  WeightFromStartVertex(this.vertex, this.weight);

  final Vertex vertex;
  final double weight;

  factory WeightFromStartVertex.empty() => WeightFromStartVertex(Vertex.empty(), -1);
  @override
  String toString() {
    return 'vertex:$vertex,weight: $weight';
  }
}

/// 小顶堆
class PriorityQueue {
  PriorityQueue(int vertexCount) {
    list = List.filled(vertexCount + 1, WeightFromStartVertex.empty());
  }

  late final List<WeightFromStartVertex> list;
  final int firstVertexIndex = 1;
  late int vertexCount = firstVertexIndex;

  void add(Vertex vertex, double weightFromStart) {
    if (vertexCount == list.length) {
      // 填满了
      return;
    }
    list[vertexCount] = WeightFromStartVertex(vertex, weightFromStart);
    // 自底向上堆化
    int currentIndex = vertexCount;
    int parentIndex = vertexCount ~/ 2;
    while (parentIndex > 0 && list[currentIndex].weight < list[parentIndex].weight) {
      swap(currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex ~/= 2;
    }
    vertexCount++;
  }

  bool update(Vertex vertex, double weightFromStart) {
    int targetIndex = -1;
    for (int i = 0; i < vertexCount; i++) {
      if (list[i].vertex.id == vertex.id) {
        targetIndex = i;
        break;
      }
    }
    if (targetIndex <= 0) {
      return false;
    }

    final newVertex = WeightFromStartVertex(vertex, weightFromStart);
    list[targetIndex] = newVertex;
    int currentIndex = targetIndex;
    int parentIndex = vertexCount ~/ 2;
    while (parentIndex > 0 && list[currentIndex].weight < list[parentIndex].weight) {
      swap(currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex ~/= 2;
    }
    return true;
  }

  Vertex? poll() {
    if (isEmpty) return null;
    final firstVertex = list[firstVertexIndex];
    list[firstVertexIndex] = list[--vertexCount];
    int currentIndex = firstVertexIndex;
    int leftChildIndex = currentIndex * 2;
    int rightChildIndex = leftChildIndex + 1;
    while (leftChildIndex <= vertexCount && rightChildIndex <= vertexCount) {
      int changeIndex = currentIndex;
      if (list[changeIndex].weight > list[leftChildIndex].weight) {
        changeIndex = leftChildIndex;
      }
      if (list[changeIndex].weight > list[rightChildIndex].weight) {
        changeIndex = rightChildIndex;
      }
      if (changeIndex == currentIndex) {
        break;
      }

      swap(currentIndex, changeIndex);
      currentIndex = changeIndex;
      leftChildIndex = currentIndex * 2;
      rightChildIndex = leftChildIndex + 1;
    }

    return firstVertex.vertex;
  }

  bool get isEmpty => vertexCount == firstVertexIndex;

  bool swap(int i, int j) {
    if (i >= list.length || j >= list.length) return false;
    final tmp = list[i];
    list[i] = list[j];
    list[j] = tmp;
    return true;
  }
}
