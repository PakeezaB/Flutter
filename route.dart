import 'package:flutter/material.dart';
import 'package:routes_appp2/routenames.dart';
import 'package:routes_appp2/screen1.dart';
import 'package:routes_appp2/screen2.dart';
import 'package:routes_appp2/screen3.dart';

class Routes {
  //static-> to be accessed on class level
  //Routes-> is return type

  //dynamic and matgerialPage route both can be used

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.firstScreen:
        return MaterialPageRoute(builder: (context) => const FirstScreen());
      case RouteNames.secondScreen:
        return MaterialPageRoute(
            builder: (context) => SecondScreen(
                  data: settings.arguments as Map,
                ));
      case RouteNames.thirdScreen:
        return MaterialPageRoute(builder: (context) => const ThirdScreen());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text("No Route defined"),
                ),
              ),
            );
          },
        );
    }
  }
}
