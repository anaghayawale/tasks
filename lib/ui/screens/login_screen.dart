import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/custom_button.dart';
import 'package:tasks/ui/widgets/custom_heading.dart';
import 'package:tasks/ui/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      const CustomSnackbar(
        snackbarText: 'Please enter all the fields',
        snackbarTextColor: Colors.red,
      ).showSnackBar(context);
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      const CustomSnackbar(
        snackbarText: 'Please enter a valid email address',
        snackbarTextColor: Colors.red,
      ).showSnackBar(context);
    }

    if (password.length < 6) {
      const CustomSnackbar(
        snackbarText: 'Password should be at least 6 characters long',
        snackbarTextColor: Colors.red,
      ).showSnackBar(context);
    }

    final String apiUrl = 'http://taskmasterapp.vercel.app/api/login';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'taskmastertoken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MTk4MDQ1MzMzZDZhYjkxZDBjZDYyZSIsImlhdCI6MTcwMDgwNDYzMX0.QojNGPR90sVxIibd93q8B3wafVVnKpI9N8qZZu9PeFI'
    };
    final Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(requestBody),
      );

      if (response.statusCode == 308 &&
          response.headers.containsKey('location')) {
        // Successful login
        var redirectUrl = response.headers['location'];
        // print('Redirect URL: $redirectUrl');

        // Make another request to the redirect URL
        var redirectResponse = await http.post(Uri.parse(redirectUrl!),
            body: jsonEncode({
              "email": email,
              "password": password,
            }));

        // Process the response from the redirect
        print('Redirect Response status: ${redirectResponse.statusCode}');
        print('Redirect Response body: ${redirectResponse.body}');

        // Parse the response body as JSON
        var responseBody = jsonDecode(redirectResponse.body);

        // Get the message from the JSON response
        var message = responseBody['message'];
        var success = responseBody['success'];
        
        // Show the message in a Snackbar
        if (success == true) {
          // ignore: use_build_context_synchronously
          print('Login successful: $message');
        } else if (success == false){
          var error = responseBody['error'];
          // ignore: use_build_context_synchronously
          print('Login failed: $error');
        }
    }} catch (e) {
      print('Error: $e');
    }
  }

  void showMessage(BuildContext context, String message, Color snackbarColor) {
    CustomSnackbar(
      snackbarText: message,
      snackbarTextColor: snackbarColor,
    ).showSnackBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Image.asset(
                "assets/images/vector-1.png",
                width: 413,
                height: 457,
              ),
            ),
            // const SizedBox(
            //   height: 17,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeading(text: 'Log In'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                      labelName: 'Email', textController: _emailController),
                  const SizedBox(height: 15),
                  CustomTextfield(
                      labelName: 'Password',
                      textController: _passwordController),
                  const SizedBox(height: 20),
                  CustomButton(
                    buttonText: 'Sign In',
                    onPressed: _loginUser,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: Color(0xFF837E93),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signUp');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Color(0xFF755DC1),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
