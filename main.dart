import 'package:flutter/material.dart';
import 'package:routes_appp2/route.dart';
import 'package:routes_appp2/routenames.dart';

void main() {
  runApp(const RoutingApp());
}

class RoutingApp extends StatelessWidget {
  const RoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouteNames.firstScreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
