import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/HomeControllers.dart';
import 'package:flutter_crud/Model/DeleteUpdateUserModel.dart';
import 'package:flutter_crud/Service/CrudOperations.dart';
import 'package:get/get.dart';


class CreateController extends GetxController {
  final dateText = "".obs;
  DateTime? UserBirthDay;
  final horoscope = "".obs;
  final horoscopeUrl = "".obs;
  int? birthD;
  int? birthM;
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  Future<String> horoscopeOperation() async {
    if ((birthM == 1 && birthD! <= 20) || (birthM == 12 && birthD! >= 22)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_oglak.jpg";
      return horoscope.value = "Capricorn";
    } else if ((birthM == 1 && birthD! >= 21) ||
        (birthM == 2 && birthD! <= 18)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_kova.jpg";
      return horoscope.value = "Aquarius";
    } else if ((birthM == 2 && birthD! >= 19) ||
        (birthM == 3 && birthD! <= 20)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_balik.jpg";
      return horoscope.value = "Pisces";
    } else if ((birthM == 3 && birthD! >= 21) ||
        (birthM == 4 && birthD! <= 20)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_koc.jpg";
      return horoscope.value = "Aries";
    } else if ((birthM == 4 && birthD! >= 21) ||
        (birthM == 5 && birthD! <= 20)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_boga.jpg";
      return horoscope.value = "Taurus";
    } else if ((birthM == 5 && birthD! >= 21) ||
        (birthM == 6 && birthD! <= 20)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_ikizler.jpg";
      return horoscope.value = "Gemini";
    } else if ((birthM == 6 && birthD! >= 21) ||
        (birthM == 7 && birthD! <= 22)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_yengec.jpg";
      return horoscope.value = "Cancer";
    } else if ((birthM == 7 && birthD! >= 23) ||
        (birthM == 8 && birthD! <= 23)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_aslan.jpg";
      return horoscope.value = "Leo";
    } else if ((birthM == 8 && birthD! >= 24) ||
        (birthM == 9 && birthD! <= 23)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_basak.jpg";
      return horoscope.value = "Virgo";
    } else if ((birthM == 9 && birthD! >= 24) ||
        (birthM == 10 && birthD! <= 23)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_terazi.jpg";
      return horoscope.value = "Libra";
    } else if ((birthM == 10 && birthD! >= 24) ||
        (birthM == 11 && birthD! <= 22)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_akrep.jpg";
      return horoscope.value = "Scorpio";
    } else if ((birthM == 11 && birthD! >= 23) ||
        (birthM == 12 && birthD! <= 21)) {
      horoscopeUrl.value =
          "https://i.elle.com.tr/elle-test-images/elle_yay.jpg";
      return horoscope.value = "Sagittarius";
    } else {
      return horoscope.value = "";
    }
  }

  Future<void> createUserButton() async {
    final controllerHome = Get.find<HomeControllers>();
    horoscopeOperation();
    DeleteUpdateUserModel userModel = DeleteUpdateUserModel(
      name: nameController.text,
      image: imageController.text,
      birthday: UserBirthDay!,
      horoscope: horoscope.value,
      horoscopeUrl: horoscopeUrl.value,
    );
    final Person = await CrudOperations.createUser(userModel);
    if (Person != null) {
      controllerHome.data.add(Person);
    } else {
      debugPrint("Kayıt gerçekleştirilmedi");
    }
    controllerHome.showUsers();
    Get.back();
  }
}
