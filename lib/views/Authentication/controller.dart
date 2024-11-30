import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:todo/views/Authentication/login.dart';

import '../home/home_screen.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  RxString userId = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
        User? user = userCredential.user;

        if (user != null) {
          userId.value = user.uid;
          Get.snackbar('Success', 'Login successful');
          Get.off(() => HomeScreen());
        } else {
          Get.snackbar('Error', 'User not found');
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  }

  Future<void> signup() async {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        password.value == confirmPassword.value) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: email.value.trim(),
          password: password.value.trim(),
        );
        Get.snackbar('Success', 'Signup successful');
        email.value = '';
        password.value = '';
        confirmPassword.value = '';

        Get.offAll(() => LoginScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Get.snackbar('Error',
              'The email address is already in use by another account.');
        } else {
          Get.snackbar('Error', e.message!);
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    } else {
      Get.snackbar('Error', 'Password and Confirm password are not same');
    }
  }
}
