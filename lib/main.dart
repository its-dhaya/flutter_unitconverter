import 'package:flutter/material.dart';
import 'package:unitconverter/unitconverter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Unit Converter App',style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: UnitConverterPage(),
      ),
    );
  }
}
 