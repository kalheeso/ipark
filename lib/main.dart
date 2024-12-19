import 'package:flutter/material.dart';
import 'package:ipark/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Park',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
        // appBarTheme: AppBarTheme(color: Color(0xff0A84FF), ),
          useMaterial3: true,
          scaffoldBackgroundColor: Color.fromARGB(255, 14, 13, 13),
          // scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color(0xff161616),
              selectedIconTheme: IconThemeData(color: Color(0xff0A84FF)),
              selectedItemColor: Color(0xff0A84FF),
              selectedLabelStyle: TextStyle(
                color: Color(0xff0A84FF),
              ),
              unselectedLabelStyle: TextStyle(
                color: Color(0xff757575),
              ),
              unselectedItemColor: Color(0xff757575)
              ),
              ),
      home: const MyHomePage(title: 'Easy Park'),
    );
  }
}