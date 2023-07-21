import 'package:flutter/material.dart';
import 'package:geeta_sutra/page/homepage.dart';
import 'package:geeta_sutra/page/splash_screen.dart';
import 'package:geeta_sutra/page/versepage.dart';


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
      title: 'Bhagavad Gita',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/home",
      routes: { 
        "/":(context) => const PostClass(),
        "/home" :(context) => const PostClass(),
        "/chapter" :(context) => const HomePage(),
        "/verse" :(context) => const VersePage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => const HomePage(),),
    );
  }
}
