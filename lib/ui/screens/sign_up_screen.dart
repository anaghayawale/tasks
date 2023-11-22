import 'package:flutter/material.dart';
import 'package:tasks/ui/screens/login_screen.dart';
import 'package:tasks/ui/widgets/custom_button.dart';
import 'package:tasks/ui/widgets/custom_heading.dart';
import 'package:tasks/ui/widgets/custom_textfield.dart';

import '../widgets/custom_snackbar.dart';

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

  void _registerUser() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String repass = _repassController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || repass.isEmpty) {
      const CustomSnackbar(
        snackbarText: 'Please enter all the fields',
        snackbarTextColor: Colors.red,
      ).showSnackBar(context);
    }

    if (!RegExp(r'[a-zA-Z]').hasMatch(name)) {
      const CustomSnackbar(
        snackbarText: 'Name should contain letters',
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

    if (password != repass) {
      const CustomSnackbar(
              snackbarText: 'Passwords do not match',
              snackbarTextColor: Colors.red)
          .showSnackBar(context);
    }
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
                  CustomTextfield(
                      labelName: 'Name', textController: _nameController),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                      labelName: 'Email', textController: _emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                      labelName: 'Password',
                      textController: _passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                      labelName: 'Confirm Password',
                      textController: _repassController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      buttonText: 'Create account', onPressed: _registerUser),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
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
