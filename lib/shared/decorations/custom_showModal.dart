import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShowModal {
  static void showInModal(Widget widget) {
    Get.bottomSheet(
      widget, // Your custom widget for the modal content
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      barrierColor: Colors.black54,
      backgroundColor: Colors.white,
      isDismissible: true,
      enableDrag: true,
    );
  }
}
