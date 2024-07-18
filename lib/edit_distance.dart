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
}
