import 'package:flutter/material.dart';
import 'package:tasks/ui/screens/home_screen.dart';
import 'package:tasks/ui/screens/login_screen.dart';
import 'package:tasks/ui/screens/sign_up_screen.dart';

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
      theme: ThemeData.light().copyWith(useMaterial3: true),
      darkTheme: ThemeData.light(),
      //home: const LoginScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
      
    );
  }
}

