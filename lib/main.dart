import 'package:flutter/material.dart';
import 'package:unitconverter/kgandpounds.dart';
import 'package:unitconverter/landing_page.dart';
import 'package:unitconverter/milesandkms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: LandingPage(),
      routes: { 
        '/miles_and_kms': (context) => MilesAndKms(),
        '/kg_to_pounds': (context) => KgAndPounds(),// Define route for unit converter screen
      },
    );
  }
}