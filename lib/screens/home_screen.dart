import 'package:flutter/material.dart';

import '../widgets/custom_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const CustomSnackbar(
        snackbarText: 'Welcome to the Home Screen!',
        snackbarTextColor: Colors.green, // Customize the color as needed
      ).showSnackBar(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}