import 'package:flutter/material.dart';
import '../presentation/screens/home_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {'/': (context) => HomeScreen()};
}
