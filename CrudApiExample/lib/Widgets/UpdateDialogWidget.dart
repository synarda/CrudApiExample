import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/CreateController.dart';
import 'package:flutter_crud/Controllers/HomeControllers.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import '../Controllers/UpdateController.dart';
import '../Model/UsersModel.dart';

class UpdateDialogWidget extends GetView<UpdateController> {
  const UpdateDialogWidget({Key? key, this.userModel}) : super(key: key);
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    final controllerCreate = Get.find<CreateController>();
    final controllerHome = Get.find<HomeControllers>();
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      title: const Text("UPDATE USER"),
      content: SizedBox(
        width: Get.width / 2,
        height: Get.height / 2.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("Name"),
                    ],
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: controller.updateNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("image"),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    width: 500,
                    child: TextField(
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                      controller: controller.updateImageController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("Birthday"),
                    ],
                  ),
                  GestureDetector(
                      onTap: () => DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 1, 1),
                              maxTime: DateTime(2019, 12, 31),
                              onChanged: (dateupdate) {
                          }, onConfirm: (dateupdate) {
                            controllerCreate.birthD= dateupdate.day;
                            controllerCreate.birthM = dateupdate.month;
                            controller.updateTxtDate.value="${dateupdate.day}/${dateupdate.month}/${dateupdate.year}";
                            controllerCreate.UserBirthDay = DateTime(dateupdate.year, dateupdate.month, dateupdate.day);
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en),
                      child:  SizedBox(
                        height: 45,
                        width: 500,
                        child: Card(
                            shape: const StadiumBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Obx(() => Text(controller.updateTxtDate.value),)
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                            controllerCreate.horoscopeOperation();
                            debugPrint(controllerCreate.horoscope.toString());
                            controller.updateUser(UserModel(
                                id: controllerHome.idUser.value,
                                name: controller.updateNameController.text,
                                image: controller.updateImageController.text,
                                birthday: controllerCreate.UserBirthDay!,
                                horoscope: controllerCreate.horoscope.value,
                                horoscopeUrl: controllerCreate.horoscopeUrl.value));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        child: const Text("Update"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
