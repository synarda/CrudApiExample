import 'package:flutter/material.dart';
import 'package:flutter_crud/Controllers/HomeControllers.dart';
import 'package:flutter_crud/Widgets/FloatingActionButtonWidget.dart';
import 'package:flutter_crud/Widgets/ListWidget.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeControllers> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crud API Example"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: const [
          ListWidget(),
        ],
      ),
      floatingActionButton: const FloatActionButtonWidget(),
    );
  }
}
