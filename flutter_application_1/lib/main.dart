import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Loading.dart';
import 'package:flutter_application_1/pages/choose_location.dart';
import 'pages/Home.dart';

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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/Loading': (context) => const Loading(),
        '/chooseLocation': (context) => const ChooseLocation(),
      },
    );
  }
}
