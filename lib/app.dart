import "package:calculatorapp/home_view.dart";
import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icecream application',
      // theme: ThemeData(primarySwatch: Colors.deepOrange),
      // theme: ThemeData(primarySwatch: Colors.red),
      // theme: ThemeData(primarySwatch: Colors.red),

      home: const MyHomePage(title: 'Icecream App'),
    );
  }
}
