import "package:calculatorapp/home_view.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icecream application',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          fontFamily: GoogleFonts.dmSans().fontFamily),
      home: const MyHomePage(title: 'Icecream App'),
    );
  }
}
