import 'package:flutter/material.dart';
import 'package:lmao/EXERCISE-3/ui/screens/welcome_screen.dart';
import 'package:lmao/EXERCISE-3/ui/screens/temperature_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showWelcome = true;

  void goToConverter() {
    setState(() {
      showWelcome = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple,
      ),
      home: Scaffold(
        body: showWelcome
            ? WelcomeScreen(onStart: goToConverter)
            : TemperatureScreen(),
      ),
    );
  }
}