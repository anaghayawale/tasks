import 'package:flutter/material.dart';
import 'package:tasks/ui/screens/sign_up_screen.dart';
import 'package:tasks/ui/widgets/custom_button.dart';
import 'package:tasks/ui/widgets/custom_heading.dart';
import 'package:tasks/ui/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  CustomTextfield(labelName: 'Email', textController: _emailController),
                  const SizedBox(height: 15),
                  CustomTextfield(labelName: 'Password', textController: _passwordController),
                  const SizedBox(height: 20),
                  const CustomButton(buttonText: 'Sign In'),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
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