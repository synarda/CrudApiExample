import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/AlertControllers.dart';
import 'package:flutter_crud/Model/UsersModel.dart';
import 'package:flutter_crud/Service/CrudOperations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeControllers extends GetxController {

  final alertController = Get.put(AlertController());
  late TextEditingController apiKeyController = TextEditingController();
  late TextEditingController searchController = TextEditingController();
  String namekey = "apiKey";
  final apiKey = "".obs;
  final data = <UserModel>[].obs;
  final searchList = <UserModel>[].obs;
  final isVisible = false.obs;
  final activeColor = Colors.teal.obs;
  final idUser = "".obs;

  Future<bool> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        namekey, apiKeyController.text.toString());
  }

  Future<void> showUsers() async {
    final result = await CrudOperations.getUsers();
    if (result != null) {
      data.value = result;
    } else {
      alertController.showNoData();
    }
    Get.back();
  }

  Future<void> delete(String id) async {
    final result = await CrudOperations.deleteUser(id);
    if (result != null) {
      data.removeWhere((e) => e.id == id);
    } else {
    }
  }

  void searchFunction(String  value){
    for (var element in data) {
      if(element.name.contains(value)){
        searchList.value = data
            .where((element) =>  element.name
            .toLowerCase()
            .contains(value.toLowerCase()))
            .toList();
      }
      data.value = searchList;
    }
  }


  @override
  void onInit() async {
    final preferences = await SharedPreferences.getInstance();
    apiKey.value = preferences.getString(namekey) ?? "";
    super.onInit();
  }

  @override
  void onReady() async {
    showUsers();
    super.onReady();
  }
}
