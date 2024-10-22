import 'package:assignment_five/bmi_gender.dart';
import 'package:assignment_five/bmi_info.dart';
import 'package:assignment_five/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({super.key});

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  @override
  Widget build(BuildContext context) {
    // final List<dynamic> args = Get.arguments ?? [];
    // final String height = args[0] ?? '0';
    // final String weight = args[1] ?? '0';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Result",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w100,
                      color: Colors.red),
                ),
              ],
            ),
            Image.asset(
              "Assets/images/result.png",
              width: MediaQuery.sizeOf(context).width / 2,
              fit: BoxFit.contain,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => BmiGender(),
                          transition: Transition.fade,
                        );
                      },
                      style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all(const Size(50, 50)),
                        maximumSize:
                            WidgetStateProperty.all(const Size(100, 50)),
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
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
