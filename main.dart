import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/homepage.dart';
import 'package:habit_tracker/theme/theme_changer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("Habit_Database");

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor: const Color.fromARGB(255, 174, 249, 147),
        splash: const Center(
          child: Text(
            "Habit Tracker",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        nextScreen: const HomePage(),
        duration: 2000,
      ),
      theme: Provider.of<ThemeChanger>(context).themeData,
    );
  }
}
