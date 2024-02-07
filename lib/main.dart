import 'package:flutter/material.dart';
import 'package:biblioapp/scanner_screen.dart';
import 'package:biblioapp/create_screen.dart';
import 'package:biblioapp/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/scanner': (context) => const ScannerPage(),
        '/create': (context) => const CreatePage(),
      },
    );
  }
}
