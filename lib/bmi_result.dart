import 'package:assignment_five/bmi_gender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({super.key});

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  double calculateBmi(double weight, double height) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  Map<String, String> getBmiCategory(double bmi, String gender) {
    if (bmi < 18.5) {
      return {
        'category': 'Underweight',
        'advice': gender == 'Male'
            ? 'You might need to gain some weight. Consider a balanced diet rich in protein and healthy fats.'
            : 'It is important to focus on nutrient-rich foods. Consult a nutritionist for advice on healthy weight gain.',
        'image': 'Assets/images/underweight.png',
        'message':
            'Stay positive! With the right approach, you can reach a healthy weight soon.'
      };
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return {
        'category': 'Normal Weight',
        'advice':
            'Great job! Maintain your weight with a balanced diet and regular physical activity.',
        'image': 'Assets/images/normal_weight.png',
        'message': 'Congratulations! You are in the healthy weight range.'
      };
    } else if (bmi >= 25 && bmi <= 29.9) {
      return {
        'category': 'Overweight',
        'advice': gender == 'Male'
            ? 'Try to engage in regular exercise and monitor your diet to prevent further weight gain.'
            : 'Consider including low-impact activities like yoga or swimming to manage your weight.',
        'image': 'Assets/images/over_weight.png',
        'message': 'Don\'t worry! Small changes can lead to big improvements.'
      };
    } else {
      return {
        'category': 'Obesity',
        'advice': gender == 'Male'
            ? 'It is recommended to consult a healthcare provider for a weight management plan.'
            : 'Focus on gradual lifestyle changes. Seek guidance from a healthcare professional.',
        'image': 'Assets/images/obesity.png',
        'message':
            'Stay motivated! A healthier lifestyle is within reach with the right support.'
      };
    }
  }

  void showSnackbar(String category) {
    String title;
    String message;

    switch (category) {
      case 'Underweight':
        title = "Keep Going!";
        message = "Every small step towards better health matters.";
        break;
      case 'Normal Weight':
        title = "Great Job!";
        message = "You are in the healthy range—keep it up!";
        break;
      case 'Overweight':
        title = "You Can Do It!";
        message = "Small changes can make a big difference—start today!";
        break;
      default:
        title = "Stay Motivated!";
        message = "A healthier you is just a step away—stay consistent!";
        break;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[300],
        colorText: Colors.black,
        duration: const Duration(seconds: 3),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> args = Get.arguments;
    final String gender = (args[0] as String?) ?? 'Male';
    final double height = double.tryParse(args[1]?.toString() ?? '0') ?? 0;
    final double weight = double.tryParse(args[2]?.toString() ?? '0') ?? 0;

    double bmi = calculateBmi(weight, height);
    Map<String, String> bmiInfo = getBmiCategory(bmi, gender);
    showSnackbar(bmiInfo['category'] ?? '');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "REPORT",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Your BMI: ",
                        style: GoogleFonts.ebGaramond(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                      TextSpan(
                        text: "${bmi.toStringAsFixed(1)}",
                        style: GoogleFonts.ebGaramond(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Category: ",
                        style: GoogleFonts.ebGaramond(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: bmiInfo['category'] ?? '',
                        style: GoogleFonts.ebGaramond(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    bmiInfo['advice'] ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    bmiInfo['image'] ?? '',
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => const BmiGender(),
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
                        'Try Again',
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
