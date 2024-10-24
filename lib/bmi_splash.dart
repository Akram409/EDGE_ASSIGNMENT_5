import 'dart:async';
import 'package:assignment_five/bmi_gender.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BmiSplash extends StatefulWidget {
  const BmiSplash({super.key});

  @override
  State<BmiSplash> createState() => _BmiSplashState();
}

class _BmiSplashState extends State<BmiSplash> {
  startTimer() async {
    Timer(const Duration(seconds: 3), () {
      // Code
      Get.to(const BmiGender());
    });
  }

  @override

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset(
                    "Assets/images/bmi.png",
                    height: MediaQuery.sizeOf(context).height / 4,
                    width: MediaQuery.sizeOf(context).width / 4,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "BMI",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        letterSpacing: 5),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Calculator",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                        letterSpacing: 4),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
