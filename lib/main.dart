import 'package:flutter/material.dart';
// import 'core/routes.dart';
import 'package:provider/provider.dart';
import 'core/providers/counter_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // routes: AppRoutes.routes,
      home: HomeScreen(),
    );
  }
}
