import 'dart:math' as Math;

class Package0_1 {
  int maxW = 0;

  /// 回溯法，递归查找
  void f(int i, int cw, List<int> items, int n, int w) {
    if (cw == w || i == n) {
      if (cw > maxW) maxW = cw;
      return;
    }

    // 进入递归查找，每次都有装和不装两种情况

    // 不装
    f(i + 1, cw, items, n, w);
    if (cw + items[i] <= w) {
      // 装
      f(i + 1, cw + items[i], items, n, w);
    }
  }
}

/// 0-1 背包问题，找到价格最大的组合，不超过最大重量
class Knapsack1 {
  Knapsack1(this.maxWeight, this.items);

  final int maxWeight;
  final List<Item1> items;
  final List<List<Item1>> latestSolveResult = [];

  void solve() {
    // 状态建模：下标表示重量，值表示对应重量的最大价格
    final List<int> states = List.filled(maxWeight + 1, -1);
    states[0] = 0;

    for (int i = 0; i < items.length; i++) {
      final currentItem = items[i];
      final currentWeight = currentItem.weight;
      final currentPrice = currentItem.price;

      for (int j = maxWeight - currentWeight; j >= 0; j--) {
        // 重量从后往前加，本轮只会基于上一轮的状态做变更，从前往后会在本轮计算中，混入本轮的数据，这样加加重了。
        if (states[j] < 0) continue; //上一步，没有达到这个重量状态
        final oldPrice = states[j + currentWeight];
        final newPrice = states[j] + currentPrice;

        states[j + currentWeight] = Math.max(oldPrice, newPrice);
      }
    }
    // 处理完后，states 存储了各个重量下的最大价格。

    return printItem(states);
  }

  void printItem(List<int> states) {
    int maxPrice = -1;
    int maxWeight = -1;
    for (int i = 0; i < states.length; i++) {
      if (states[i] > maxPrice) {
        maxPrice = states[i];
        maxWeight = i;
      }
    }

    printResult([], 0, maxWeight, maxPrice, states);
  }

  void printResult(List<Item1> result, int index, int maxWeight, int maxPrice, List<int> states) {
    // 这里递归的时间复杂度是 O(2^n) 我们构建了一个 16 个元素的数组来尝试，没有计算出来结果，太久了～
    final currentWeight;
    final currentPrice;
    if (result.isEmpty) {
      currentWeight = 0;
      currentPrice = 0;
    } else {
      currentWeight = result.map((e) => e.weight).reduce((value, element) => value + element);
      currentPrice = result.map((e) => e.price).reduce((value, element) => value + element);
    }
    if (maxPrice == currentPrice && maxWeight == currentWeight) {
      latestSolveResult.add(result);
      return;
    }

    for (int i = index; i < items.length; i++) {
      final currentItem = items[i];
      final currentWeight = currentItem.weight;
      final currentPrice = currentItem.price;

      final newPrice = states[maxWeight] - currentPrice;
      final newWeight = maxWeight - currentWeight;

      if (newPrice == states[newWeight]) {
        printResult(result, index + 1, maxWeight, maxPrice, states);

        printResult([...result, items[i]], index + 1, maxWeight, maxPrice, states);
      }
    }
  }
}

class Item1 {
  Item1(this.id, this.weight, this.price);

  final int id;
  final int weight;
  final int price;

  @override
  String toString() {
    return 'id:$id,weight:$weight,price:$price';
  }
}
