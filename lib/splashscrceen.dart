import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/features/authentication/screens/signup.dart';
import 'package:krishi/features/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  _checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.off(const SignUp());
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.off(Dashboard(uid: user.uid));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Image.asset(
          'assets/images/farmer.jpeg',
          // height: 200,
          // width: 200,
        ),
      ),
    );
  }
}
