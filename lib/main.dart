import 'package:flutter/material.dart';
import 'package:google_translator_deneme1/test_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestTranslation(),
    );
  }
}
