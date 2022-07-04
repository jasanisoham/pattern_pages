import 'package:flutter/material.dart';
import 'package:pattern/Pages/login_page.dart';
import 'package:pattern/Pages/singup_page.dart';
import 'package:pattern/Pages/splash_screen.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(
    const TodoApp(),
  );
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
        routes: {
          'splash_screen' : (context) => const SpalshScreen(),
          'login_page' : (context) => const LoginPage(),
          'singup_page' : (context) => const SignUpPage(),
          '/' : (context) => const HomePage(),
        }
    );
  }
}
