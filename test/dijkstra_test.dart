import 'package:flutter_application_1/dijkstra.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PriorityQueue', () {
    test('isEmpty', () {
      final queue = PriorityQueue(5);
      expect(queue.isEmpty, true);
    });

    test('add', () {
      final queue = PriorityQueue(5);
      queue.add(Vertex('1'), 1.0);
      expect(queue.isEmpty, false);
      expect(queue.list[1].vertex.id, '1');
      expect(queue.list[1].weight, 1.0);
    });

    test('poll - empty queue', () {
      final queue = PriorityQueue(5);
      expect(queue.poll(), isNull);
    });

    test('poll - single element', () {
      final queue = PriorityQueue(5);
      queue.add(Vertex('1'), 1.0);
      expect(queue.poll()?.id, '1');
      expect(queue.isEmpty, true);
    });

    test('poll - multiple elements', () {
      final queue = PriorityQueue(5);
      queue.add(Vertex('1'), 1.0);
      queue.add(Vertex('2'), 2.0);
      queue.add(Vertex('3'), 3.0);
      expect(queue.poll()?.id, '1');
      expect(queue.poll()?.id, '2');
      expect(queue.poll()?.id, '3');
      expect(queue.isEmpty, true);
    });

    test('poll - duplicate elements', () {
      final queue = PriorityQueue(5);
      queue.add(Vertex('1'), 1.0);
      queue.add(Vertex('2'), 2.0);
      queue.add(Vertex('3'), 1.0);
      expect(queue.poll()?.id, '1');
      expect(queue.poll()?.id, '3');
      expect(queue.poll()?.id, '2');
      expect(queue.isEmpty, true);
    });

    test('poll - out of order elements', () {
      final queue = PriorityQueue(5);
      queue.add(Vertex('3'), 3.0);
      queue.add(Vertex('1'), 1.0);
      queue.add(Vertex('2'), 2.0);
      expect(queue.poll()?.id, '1');
      expect(queue.poll()?.id, '2');
      expect(queue.poll()?.id, '3');
      expect(queue.isEmpty, true);
    });

    test('poll - full queue', () {
      final queue = PriorityQueue(5);
      queue.add(Vertex('1'), 1.0);
      queue.add(Vertex('2'), 2.0);
      queue.add(Vertex('3'), 3.0);
      queue.add(Vertex('4'), 4.0);
      queue.add(Vertex('5'), 5.0);
      expect(queue.poll()?.id, '1');
      expect(queue.poll()?.id, '2');
      expect(queue.poll()?.id, '3');
      expect(queue.poll()?.id, '4');
      expect(queue.poll()?.id, '5');
      expect(queue.isEmpty, true);
    });

    test('add - full queue', () {
      final queue = PriorityQueue(5);
      queue.add(Vertex('1'), 1.0);
      queue.add(Vertex('2'), 2.0);
      queue.add(Vertex('3'), 3.0);
      queue.add(Vertex('4'), 4.0);
      queue.add(Vertex('5'), 5.0);
      queue.add(Vertex('6'), 6.0);
      expect(queue.list.length, 6);
      expect(queue.vertexCount, 6);
      // 队列已满，添加元素应该被忽略
      expect(queue.poll()?.id, '1');
      expect(queue.poll()?.id, '2');
      expect(queue.poll()?.id, '3');
      expect(queue.poll()?.id, '4');
      expect(queue.poll()?.id, '5');
      expect(queue.isEmpty, true);
    });

    test('add - random queue', () {
      final queue = PriorityQueue(10);
      queue.add(Vertex('1'), 1.0);
      queue.add(Vertex('5'), 5.0);
      queue.add(Vertex('2'), 2.0);
      queue.add(Vertex('7'), 7.0);
      queue.add(Vertex('3'), 3.0);
      queue.add(Vertex('4'), 4.0);
      queue.add(Vertex('10'), 10.0);
      queue.add(Vertex('8'), 8.0);
      queue.add(Vertex('9'), 9.0);
      queue.add(Vertex('6'), 6.0);
      expect(queue.poll()?.id, '1');
      expect(queue.poll()?.id, '2');
      expect(queue.poll()?.id, '3');
      expect(queue.poll()?.id, '4');
      expect(queue.poll()?.id, '5');
      expect(queue.poll()?.id, '6');
      expect(queue.poll()?.id, '7');
      expect(queue.poll()?.id, '8');
      expect(queue.poll()?.id, '9');
      expect(queue.poll()?.id, '10');

      expect(queue.isEmpty, true);
    });

    test('add - update queue', () {
      final queue = PriorityQueue(10);
      queue.add(Vertex('1'), 1.0);
      queue.add(Vertex('5'), 5.0);
      queue.add(Vertex('2'), 2.0);
      queue.add(Vertex('7'), 7.0);
      queue.add(Vertex('3'), 3.0);
      queue.add(Vertex('4'), 4.0);
      queue.add(Vertex('10'), 10.0);
      queue.add(Vertex('8'), 8.0);
      queue.add(Vertex('9'), 9.0);
      queue.add(Vertex('6'), 6.0);

      queue.update(Vertex('6'), 4.5);
      queue.update(Vertex('10'), 1.5);
      expect(queue.poll()?.id, '1');
      expect(queue.poll()?.id, '10');
      expect(queue.poll()?.id, '2');
      expect(queue.poll()?.id, '3');
      expect(queue.poll()?.id, '4');
      expect(queue.poll()?.id, '6');
      expect(queue.poll()?.id, '5');
      expect(queue.poll()?.id, '7');
      expect(queue.poll()?.id, '8');
      expect(queue.poll()?.id, '9');

      expect(queue.isEmpty, true);
    });
  });
}
