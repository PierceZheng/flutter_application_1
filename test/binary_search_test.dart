import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/binary_search.dart';

void main() {
  group('test easy search', _testEasySearch);
  group('test first search', _testFirstSearch);

  group('test last search', _testLastSearch);
  group('test first greater', _testFirstGreater);

  group('test last less', _testLastLess);
}

void _testLastLess() {
  void notFound() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 0;
    final result = BinarySearch().lastLess(list, target);
    expect(result, -1);
  }

  void found() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 5;
    final result = BinarySearch().lastLess(list, target);
    expect(result, 7);
  }

  test('test last less not found', notFound);
  test('test last less found', found);
}

void _testFirstGreater() {
  void notFound() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 10;
    final result = BinarySearch().firstGreater(list, target);
    expect(result, -1);
  }

  void found() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 5;
    final result = BinarySearch().firstGreater(list, target);
    expect(result, 11);
  }

  test('test first greater not found', notFound);
  test('test first greater found', found);
}

void _testLastSearch() {
  void notFound() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 9;
    final result = BinarySearch().lastSearch(list, target);
    expect(result, -1);
  }

  void found() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 5;
    final result = BinarySearch().lastSearch(list, target);
    expect(result, 10);
  }

  test('test last search not found', notFound);
  test('test last search found', found);
}

void _testFirstSearch() {
  void notFound() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 9;
    final result = BinarySearch().firstSearch(list, target);
    expect(result, -1);
  }

  void found() {
    const list = [1, 2, 2, 3, 3, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8, 10];
    const target = 5;
    final result = BinarySearch().firstSearch(list, target);
    expect(result, 8);
  }

  test('test first search not found', notFound);
  test('test first search found', found);
}

void _testEasySearch() {
  void notFound() {
    const list = [1, 2, 3, 4, 6, 7, 8, 9, 10];
    const target = 5;
    final result = BinarySearch().easySearch(list, target);
    expect(result, -1);
  }

  void found() {
    const list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const target = 8;
    final result = BinarySearch().easySearch(list, target);
    expect(result, 7);
  }

  test('test easy search not found', notFound);
  test('test easy search found', found);
}
