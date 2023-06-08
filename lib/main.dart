import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/tabs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meal_app/models/device_info.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {


    // if (DeviceInfo.get().isTablet ) {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.landscapeLeft,
    //   ]);
    // }

    return MaterialApp(
        theme: theme,
        home: const TabsScreen(),
    );
  }
}