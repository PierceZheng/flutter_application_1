import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const x = 60.0;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'mySqrt:${mySqrt(x, 6)}\nsystemSqrt:${math.sqrt(x)}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String mySqrt(double x, int precision) {
    if (x <= 0) {
      return 'error:$x';
    }

    final resultInteger = mySqrtInteger(x);
    int resultDecimal = 0;

    for (int i = 1; i <= precision; i++) {
      final multiplicand = math.pow(10, i).toInt();
      final target = x * multiplicand;
      final base = resultInteger * multiplicand;
      double low = base.toDouble() + resultDecimal;
      double high = low + 9;
      int mid = 0;
      while (low <= high) {
        mid = (low + ((high - low) / 2)).toInt();
        final tolerance = target / mid - mid;
        if (tolerance < 0) {
          high = mid - 1;
        } else if (tolerance > 0) {
          low = mid + 1;
        } else if (tolerance == 0) {
          break;
        }
      }
      resultDecimal = resultDecimal * 10 + mid - base;
    }

    return '$resultInteger.$resultDecimal';
  }

  int mySqrtInteger(double x) {
    double low = 0.0;
    double high = x;
    int mid = 0;
    while (low <= high) {
      mid = (low + ((high - low) / 2)).toInt();
      log('$low,$mid,$high');
      final tempTolerance = x / mid - mid;
      if (tempTolerance < 0) {
        high = mid - 1;
      } else if (tempTolerance > 0) {
        low = mid + 1;
      } else if (tempTolerance == 0) {
        break;
      }
    }
    return mid;
  }
}
