import 'package:assignment_five/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment_five/get_controller.dart';

class BmiInfo extends StatefulWidget {
  const BmiInfo({super.key});

  @override
  State<BmiInfo> createState() => _BmiInfoState();
}

class _BmiInfoState extends State<BmiInfo> {
  final BmiInfoController bmiInfoController = Get.put(BmiInfoController());

  // Controllers for height and weight inputs
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  // @override
  // void dispose() {
  //   // Dispose controllers when not needed
  //   heightController.dispose();
  //   weightController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var gender = Get.arguments;
    print(gender);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "BMI",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 3),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Your Weight",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            gender == "Male"
                                ? "Assets/images/maleW.png"
                                : "Assets/images/femaleW.png",
                            fit: BoxFit.contain,
                            width: MediaQuery.sizeOf(context).width / 2,
                            height: 300,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: TextField(
                            controller:
                                weightController, // Assign the controller
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              suffixText: "kg",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Your Height",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            gender == "Male"
                                ? "Assets/images/maleH.png"
                                : "Assets/images/femaleH.png",
                            fit: BoxFit.contain,
                            width: MediaQuery.sizeOf(context).width / 2,
                            height: 300,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: TextField(
                            controller:
                                heightController, // Assign the controller
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              suffixText: "cm",
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                        String height = heightController.text;
                        String weight = weightController.text;
                        bmiInfoController.typedInfo(height, weight);
                        Get.to(
                          () => BmiResult(),
                          arguments: [
                            bmiInfoController.typedHeight.value,
                            bmiInfoController.typedWeight.value
                          ],
                          transition: Transition.rightToLeft,
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
                        'Calculate BMI',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
