import 'package:get/get.dart';

class GenderController extends GetxController {
  var selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }
}

class BmiInfoController extends GetxController{
  var typedHeight = ''.obs;
  var typedWeight = ''.obs;

  void typedInfo(String height,String weight)
  {
    typedHeight.value = height;
    typedWeight.value = weight;
  }
}