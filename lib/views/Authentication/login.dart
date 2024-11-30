import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/views/Authentication/signup.dart';
import 'components/custom_button.dart';
import 'components/custom_textfield.dart';
import 'controller.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            // Signup Link Button
            TextButton(
              onPressed: () {
                Get.to(() => SignupScreen());
              },
              child: const Text(
                'Signup',
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Login',
                onPressed: loginController.login,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
