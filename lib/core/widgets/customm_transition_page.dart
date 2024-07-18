import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustommTransitionPage extends CustomTransitionPage<void> {
  CustommTransitionPage(
      {required LocalKey super.key,
      required super.child,
      required int duration})
      : super(
          transitionDuration: Duration(milliseconds: duration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
