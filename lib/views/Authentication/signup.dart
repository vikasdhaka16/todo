import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/custom_button.dart';
import 'components/custom_textfield.dart';
import 'controller.dart';

class SignupScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Icon(
              Icons.task_alt_rounded,
              color: Colors.blueGrey,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              label: 'Email',
              icon: 'email',
              obscureText: false,
              value: loginController.email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Password',
              icon: 'lock',
              obscureText: true,
              value: loginController.password,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Confirm Password',
              icon: 'lock',
              obscureText: false,
              value: loginController.confirmPassword,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Signup',
                onPressed: loginController.signup,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
