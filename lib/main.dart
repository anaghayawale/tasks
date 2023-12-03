import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/provider/auth_provider.dart';
import 'package:tasks/screens/home_screen.dart';
import 'package:tasks/screens/login_screen.dart';
import 'package:tasks/screens/sign_up_screen.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.session});

  final String? session;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(useMaterial3: true),
      darkTheme: ThemeData.light(),
      //home: const LoginScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/home':(context) => const HomeScreen()
      },
      
    ),);

  }
}

