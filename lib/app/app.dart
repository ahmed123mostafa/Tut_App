import 'package:flutter/material.dart';
import 'package:untitled1/presentation/resources/route_manager.dart';
import 'package:untitled1/presentation/resources/them_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}