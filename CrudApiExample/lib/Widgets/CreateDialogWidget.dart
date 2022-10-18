import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/CreateController.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';


class CreateDialogWidget extends GetView<CreateController> {
  const CreateDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      title: const Text("CREATE USER"),
      content: Container(
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
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: controller.nameController,
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
                  Container(
                    height: 60,
                    width: 500,
                    child: TextField(
                      style: const TextStyle(color: Colors.red,fontSize: 12),
                      controller: controller.imageController,
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
                      onTap: ()=>DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1900, 1, 1),
                          maxTime: DateTime(2019, 12, 31), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            controller.dateText.value = date.toString();
                            controller.birthD= date.day;
                            controller.birthM = date.month;
                            controller.UserBirthDay=DateTime(date.year, date.month, date.day);
                          }, currentTime: DateTime.now(), locale: LocaleType.en),
                      child:  SizedBox(
                        height: 45,
                        width: 500,
                        child:  Card(
                            shape: const StadiumBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),),
                            child:Center(
                              child: Obx(() =>  Text(controller.dateText.value.toString()),),
                            )
                        ),
                      )
                  ),
                  const SizedBox(height: 10,),
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
                        onPressed: () => controller.createUserButton(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        child: const Text("Create"),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
