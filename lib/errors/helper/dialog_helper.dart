import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Package Show Dialog Http Reqouest

class DialogHelper {
  static void showErrorDialog(
      {String titleException = 'Oops! Error',
      String descriptionException = 'Somthing Went Wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titleException,
                style: Get.textTheme.headline6,
              ),
              Text(
                descriptionException,
                style: Get.textTheme.headline6,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) {
                    Get.back();
                  }
                },
                child: Container(
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
