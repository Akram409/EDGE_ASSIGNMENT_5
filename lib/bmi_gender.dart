import 'package:assignment_five/bmi_info.dart';
import 'package:assignment_five/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiGender extends StatefulWidget {
  const BmiGender({super.key});

  @override
  State<BmiGender> createState() => _BmiGenderState();
}

class _BmiGenderState extends State<BmiGender> {
  final GenderController genderController = Get.put(GenderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                      letterSpacing: 5),
                ),
                SizedBox(width: 10),
                Text(
                  "Calculator",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w100,
                      color: Colors.blue),
                ),
              ],
            ),
            Text(
              "Choose Your Gender",
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: GestureDetector(
                        onTap: () {
                          print("MALE");
                          genderController.selectGender("Male");
                        },
                        child: Obx(() => Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: genderController.selectedGender.value == "Male"
                                ? Colors.blueAccent
                                : Colors.white,
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "Assets/images/male1.png",
                            fit: BoxFit.contain,
                          ),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: GestureDetector(
                        onTap: () {
                          print("FEMALE");
                          genderController.selectGender("Female");
                        },
                        child: Obx(() => Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: genderController.selectedGender.value == "Female"
                                ? Colors.blueAccent
                                : Colors.white,
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "Assets/images/female1.png",
                            fit: BoxFit.contain,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                              () => BmiInfo(),
                          arguments: genderController.selectedGender.value,
                          transition: Transition.rightToLeft,
                        );
                      },
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(const Size(50, 50)),
                        maximumSize: WidgetStateProperty.all(const Size(100, 50)),
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
