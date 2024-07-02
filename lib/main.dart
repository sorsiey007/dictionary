import 'package:dictionary/screens/definition_screen.dart';
import 'package:dictionary/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/dictionary': (context) => const DefinitionScreen(
              word: '',
              definition: '',
            ),
        // Add the route to the HomeScreen
      },
    );
  }
}
