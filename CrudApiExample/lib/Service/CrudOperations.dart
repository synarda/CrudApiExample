import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/HomeControllers.dart';
import 'package:flutter_crud/Model/DeleteUpdateUserModel.dart';
import 'package:flutter_crud/Model/UsersModel.dart';
import 'package:get/get.dart';
import '../Controllers/AlertControllers.dart';

class CrudOperations{

  static Future<List<UserModel>?> getUsers() async {
    try {
      var response = await Dio().get(
          "https://crudcrud.com/api/${Get.find<HomeControllers>().apiKey}/users");
      if (response.statusCode == 200) {
        Get.find<AlertController>().showConnected();
        Get.find<HomeControllers>().isVisible.value=true;
        Get.find<HomeControllers>().activeColor.value= Colors.green;
        return (response.data as List)
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return null;
    }  catch(e){
      Get.find<AlertController>().showFailConnect();
      Get.find<HomeControllers>().isVisible.value = false;
      Get.find<HomeControllers>().activeColor.value= Colors.teal;
      debugPrint(Get.find<HomeControllers>().isVisible.toString());
      throw Exception(e.toString());
    }
  }

  static Future<UserModel?> createUser(DeleteUpdateUserModel createUser) async {
    try {
      var response = await Dio().post(
          "https://crudcrud.com/api/${Get.find<HomeControllers>().apiKey}/users",
          data: createUser.toJson());
      if (response.statusCode == 201) {
        return response.data == null ? null : UserModel.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      debugPrint('Create user error : ${e.message}');
      return null;
    }
  }

  static Future<bool?> deleteUser(String id) async {
    try {
      var response = await Dio().delete(
          "https://crudcrud.com/api/${Get.find<HomeControllers>().apiKey}/users/$id");
      if (response.statusCode == 200) {
        return true;
      }
      return null;
    } on DioError catch (e) {
      debugPrint('Delete user error : ${e.message}');
      return null;
    }
  }

  static Future<bool?> updateUser(String id, DeleteUpdateUserModel userModel) async {
    try {
      var response = await Dio().put(
          "https://crudcrud.com/api/${Get.find<HomeControllers>().apiKey}/users/$id",
          data: userModel.toJson());
      if (response.statusCode == 200) {
        return true;
      }
      return null;
    } on DioError catch (e) {
      debugPrint('Update user error : ${e.message}');
      return null;
    }
  }
}
