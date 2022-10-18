import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/HomeControllers.dart';
import 'package:flutter_crud/Controllers/UpdateController.dart';
import 'package:flutter_crud/Widgets/UpdateDialogWidget.dart';
import 'package:get/get.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerUpdate = Get.put(UpdateController());
    final controllerHome = Get.put(HomeControllers());
    return Obx(
      () => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
            height: Get.height / 1.2,
            width: 500,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: TextField(
                    controller: controllerHome.searchController,
                    onChanged: (value) {
                      controllerHome.searchFunction(value);
                      controllerHome.searchController.text.isEmpty ? controllerHome.showUsers() : null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      labelText: "Search Anything",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controllerHome.searchController.clear();
                          controllerHome.showUsers();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 1.5,
                  width: 500,
                  child: ListView.builder(
                    itemCount: controllerHome.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                          const EdgeInsets.only(right: 20),
                                          height: 50,
                                          width: 50,
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: Image.network(controllerHome
                                                .data
                                                .elementAt(index)
                                                .image
                                                .toString()),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  padding:
                                                  const EdgeInsets.all(5),
                                                  child: Obx(
                                                        () => Text(
                                                      controllerHome.data
                                                          .elementAt(index)
                                                          .name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  )),
                                              Container(
                                                  padding:
                                                  const EdgeInsets.all(5),
                                                  child: Obx(
                                                        () => Text(
                                                      "${DateTime.now().year - controllerHome.data.elementAt(index).birthday.year} Years old",
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey),
                                                    ),
                                                  )),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(
                                                        right: 20),
                                                    height: 30,
                                                    width: 30,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      child: Image.network(
                                                          controllerHome.data
                                                              .elementAt(index)
                                                              .horoscopeUrl
                                                              .toString()),
                                                    ),
                                                  ),
                                                  Container(
                                                      padding:
                                                      const EdgeInsets.all(5),
                                                      child: Obx(
                                                            () => Text(
                                                          controllerHome.data
                                                              .elementAt(index)
                                                              .horoscope,
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.grey),
                                                        ),
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                controllerHome.idUser.value =
                                                    controllerHome.data
                                                        .elementAt(index)
                                                        .id;
                                                controllerUpdate.updateImageController
                                                    .text =
                                                "https://media-exp1.licdn.com/dms/image/C4D0BAQEGPLY1YjKmVQ/company-logo_400_400/0/1550425803175?e=2147483647&v=beta&t=mCLp27i7i3tEiwagnAOXlPQNfeiPT4vXgiQaM3D-dn4";
                                                Get.dialog(
                                                    const UpdateDialogWidget());
                                              },
                                              icon: const Icon(Icons.edit,
                                                  color: Colors.grey)),
                                          IconButton(
                                              onPressed: () {
                                                Get.find<HomeControllers>()
                                                    .delete(controllerHome.data
                                                    .elementAt(index)
                                                    .id);
                                                Get.find<HomeControllers>()
                                                    .showUsers();
                                              },
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.grey))
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
