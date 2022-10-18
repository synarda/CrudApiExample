import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AlertController extends GetxController {
  void showConnected() => Fluttertoast.showToast(msg: "Connected",fontSize: 15,backgroundColor: Colors.grey);
  void showFailConnect() => Fluttertoast.showToast(msg: "failed to connect",fontSize: 15,backgroundColor: Colors.grey);
  void showNoData() => Fluttertoast.showToast(msg: "No Data",fontSize: 15,backgroundColor: Colors.grey);
}