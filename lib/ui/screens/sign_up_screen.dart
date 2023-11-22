import 'package:flutter/material.dart';
import 'package:tasks/ui/screens/login_screen.dart';
import 'package:tasks/ui/widgets/custom_button.dart';
import 'package:tasks/ui/widgets/custom_heading.dart';
import 'package:tasks/ui/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                "assets/images/vector-2.png",
                width: 413,
                height: 457,
              ),
            ),
            // const SizedBox(
            //   height: 18,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeading(text: 'Sign Up'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(labelName: 'Name', textController: _nameController),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(labelName: 'Email', textController: _emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(labelName: 'Password', textController: _passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(labelName: 'Confirm Password', textController: _repassController),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomButton(buttonText: 'Create account'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        ' have an account?',
                        textAlign: TextAlign.center,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        },
                        child: const Text(
                          'Log In ',
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}