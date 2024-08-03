import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mulit_theme_app/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

// state of the MyApp widget, which manages the theme mode
class _MyAppState extends State<MyApp> {
  //initialize the theme mode to system, which adapts to the system-wide theme settings
  ThemeMode _themeMode = ThemeMode.system;

  //update the theme mode and trigger a rebuild of the widget tree
  void _setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Themed App',

      //themeMode property defines which theme to use
      themeMode: _themeMode,

      //light theme configuration
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),

      //dark theme configuration
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.roboto(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),

      home: MyHomePage(
        title: 'Multi-Themed App',
        setThemeMode:
            _setThemeMode, //passing the setThemeMode function to MyHomePage
      ),
    );
  }
}
