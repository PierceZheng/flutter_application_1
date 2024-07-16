import 'dart:ui';

import 'package:flutter/material.dart';

/// 八皇后问题
class EightQueens {
  final List<Widget> resultWidget = [];
  final List<int> result = List.generate(8, (index) => -1);

  /// 计算八皇后问题的结果
  /// 这里创建了 N*N 个分支，尝试每个分支的结果
  void cal8Queens(int row) {
    if (row == 8) {
      //递归终止条件，如果 8 行都放了棋子则表示这条分支是合法的，打印出来
      resultWidget.add(buildQueensWidget(result));
      return;
    }

    for (int column = 0; column < 8; column++) {
      // 从当前行的第 0 列开始尝试，如果该列安全，就进入下一行
      if (isSafe(row, column)) {
        result[row] = column;
        cal8Queens(row + 1);
      }
      // 如果该列不安全，就进入下一列
    }
  }

  /// 判断该位置是否安全
  bool isSafe(int row, int column) {
    // 这里判断安全的前提条件是按照行来放置的，从上到下，只需要判断左上和右上，不需要判断左下和右下
    int leftup = column - 1;
    int rightup = column + 1;
    for (int i = row - 1; i >= 0; i--) {
      // result[i] 表明第 i 行只能存一个元素，行不会有冲突。行是变量
      if (result[i] == column) return false; // i行的 column 列有棋子则返回 false； 保证列不冲突。
      if (leftup >= 0 && result[i] == leftup) return false; // 左对角线冲突
      if (rightup < 8 && result[i] == rightup) return false; // 右对角线冲突
      leftup--;
      rightup++;
    }
    return true;
  }

  Widget buildQueensWidget(List<int> result) {
    final List<Widget> columnChildren = [];
    for (int row = 0; row < 8; row++) {
      final List<Widget> rowChildren = [];
      for (int column = 0; column < 8; column++) {
        final String name;
        final Color textColor;
        if (result[row] == column) {
          name = 'Q';
          textColor = Colors.red;
        } else {
          name = 'X';
          textColor = Colors.black;
        }
        rowChildren.add(
          Text(
            name,
            style: TextStyle(
              color: textColor,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        );
      }
      columnChildren.add(Row(mainAxisSize: MainAxisSize.min, children: rowChildren));
    }

    return Column(mainAxisSize: MainAxisSize.min, children: columnChildren);
  }
}
