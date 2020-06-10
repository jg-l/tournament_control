// blog.gskinner.com/archives/2020/03/flutter-simplify-your-pageroutes.html

import 'package:flutter/material.dart';

typedef Widget PageBuilder();

class PageRoutes {
  static const double kDefaultDuration = .95;
  static const Curve kDefaultEaseFwd = Curves.easeOut;
  static const Curve kDefaultEaseReverse = Curves.easeOut;

  static Route<T> fade<T>(PageBuilder page,
      [double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
