import 'dart:math';

import 'package:flutter/material.dart';

extension EditDistance on String {
  int compultLWSTDistance_1(String other) {
    return _compultLWSTDistance_1(other, 0, 0, 0);
  }

  int _compultLWSTDistance_1(String other, int i, int j, int distance) {
    if (i == length && j == other.length) {
      return distance;
    } else if (i == length) {
      return distance + other.length - j;
    } else if (j == other.length) {
      return distance + length - i;
    }

    if (this[i] == other[j]) {
      return _compultLWSTDistance_1(other, i + 1, j + 1, distance);
    } else {
      final addI = _compultLWSTDistance_1(other, i + 1, j, distance + 1);
      final addJ = _compultLWSTDistance_1(other, i, j + 1, distance + 1);
      final change = _compultLWSTDistance_1(other, i + 1, j + 1, distance + 1);
      return min(min(addI, addJ), change);
    }
  }

  int compultLWSTDistance_2(String other) {
    //状态定义：对比到第(i,j)位的时候，最小的编辑长度。
    final List<List<int>> editsCount = [];

    for (int i = 0; i < length; i++) {
      editsCount.add(List.filled(other.length, 0));
    }

    if (this[0] != other[0]) {
      editsCount[0][0] = 1;
    }

    for (int i = 1; i < length; i++) {
      editsCount[i][0] = editsCount[i - 1][0] + 1;
    }
    for (int j = 1; j < other.length; j++) {
      editsCount[0][j] = editsCount[0][j - 1] + 1;
    }
    for (int i = 1; i < length; i++) {
      for (int j = 1; j < other.length; j++) {
        // 如果上一步执行的是 删除第 i 个元素，或者 j 前面插入一个元素，当前的编辑长度一定会+1
        final addI = editsCount[i - 1][j] + 1; //上一步删除了 i，当前步长要+1 嗯
        // 如果上一步执行的是 删除第 j 个元素，或者 i 前面插入一个元素, 当前的编辑长度也一定会+1
        final addJ = editsCount[i][j - 1] + 1;

        //上一步执行的增加和删除操作会在当前步骤累加 1；替换或相等的话，不影响当前步骤的编辑距离。
        final replace = editsCount[i - 1][j - 1];

        final equalCount = this[i] == other[j] ? 0 : 1;

        editsCount[i][j] = min(min(addI, addJ), (replace + equalCount));
      }
    }

    return editsCount[length - 1][other.length - 1];
  }
}
