// utils/animations.dart
import 'package:flutter/material.dart';

class AppAnimation {
  static Future<void> bounceAnimation(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;

    final controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: Scaffold.of(context),
    );

    // ignore: unused_local_variable
    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));

    controller.forward();
  }

  static Future<void> fadeInAnimation(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;

    final controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: Scaffold.of(context),
    );

    // ignore: unused_local_variable
    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    controller.forward();
  }
}
