import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/Controllers/CreateController.dart';
import 'package:get/get.dart';
import '../Model/DeleteUpdateUserModel.dart';
import '../Model/UsersModel.dart';
import '../Service/CrudOperations.dart';
import 'HomeControllers.dart';

class UpdateController extends GetxController {
  final controllerCreate = Get.put(CreateController());
  final controllerHome = Get.put(HomeControllers());
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateImageController = TextEditingController();
  DateTime? updateUserBirthDay;
  final updateTxtDate= "Birthday".obs;

  Future<void> updateUser(UserModel? userModel) async {
    controllerCreate.horoscopeOperation();
    final result = await CrudOperations.updateUser(
        userModel!.id,
        DeleteUpdateUserModel(
            name: userModel.name,
            image: userModel.image,
            birthday: userModel.birthday,
            horoscope: userModel.horoscope,
            horoscopeUrl: userModel.horoscopeUrl));
    if (result != null) {
      final controllerCreate = Get.find<HomeControllers>();
      final user =
      controllerCreate.data.firstWhere((e) => e.id == userModel.id);
      user.name = userModel.name;
      user.image = userModel.image;
      user.birthday = userModel.birthday;
    } else {
    }
    controllerHome.showUsers();
    Get.back();
  }

  @override
  void onClose() async {
    updateNameController.dispose();
    updateTxtDate.value= "birthday";
    super.onClose();
  }
}
