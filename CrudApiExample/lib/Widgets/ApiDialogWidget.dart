import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/HomeControllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiDialogWidget extends StatelessWidget {
  const ApiDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerHome = Get.put(HomeControllers());
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      title: const Text("ENTER API KEY"),
      content: SizedBox(
        width: Get.width / 2,
        height: Get.height / 3.5,
        child:
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Api Key"),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: controllerHome.apiKeyController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed:() async => await launch("https://crudcrud.com/"),
                    child: const Text(
                      "Click for api key",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed:() async{
                  controllerHome.saveData();
                  final preferences = await SharedPreferences.getInstance();
                  controllerHome.apiKey.value = preferences.getString(controllerHome.namekey) ?? "";
                  controllerHome.data.clear();
                  controllerHome.showUsers();
                  Get.back();
                }, child: const Text("Connect"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
