import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/CreateController.dart';
import 'package:flutter_crud/Widgets/ApiDialogWidget.dart';
import 'package:get/get.dart';
import '../Controllers/HomeControllers.dart';
import 'CreateDialogWidget.dart';

class FloatActionButtonWidget extends StatelessWidget {
  const FloatActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerCreate= Get.put(CreateController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Obx(
          () => FloatingActionButton(
              backgroundColor: Get.find<HomeControllers>().activeColor.value,
              elevation: 0,
              heroTag: 1,
              onPressed: () =>
                  Get.dialog(const ApiDialogWidget()), // .bottomSheet
              child: const Icon(Icons.person)),
        ),
        const SizedBox(height: 15),
        Obx(
          () => Visibility(
            visible: Get.find<HomeControllers>().isVisible.value,
            child: FloatingActionButton(
              backgroundColor:Colors.grey,
              elevation: 0,
              heroTag: 2,
              mini: true,
              onPressed: () {
                controllerCreate.imageController.text = "https://media-exp1.licdn.com/dms/image/C4D0BAQEGPLY1YjKmVQ/company-logo_400_400/0/1550425803175?e=2147483647&v=beta&t=mCLp27i7i3tEiwagnAOXlPQNfeiPT4vXgiQaM3D-dn4";
                Get.dialog( const CreateDialogWidget());
                 },
              child: const Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
