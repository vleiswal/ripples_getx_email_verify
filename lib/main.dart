import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var emailEditController = TextEditingController();
  var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Email Verification',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Email Verification - GetX'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: emailEditController,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.all(16),
                child: RaisedButton(
                  child: Text('Write'),
                  onPressed: () {
                    if (GetUtils.isEmail(emailEditController.text)) {
                      storage.write('email', emailEditController.text);
                    } else {
                      Get.snackbar(
                        'Incorrect Format',
                        'Please provide a valid email address',
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: RaisedButton(
                  child: Text('Read'),
                  onPressed: () {
                    print('The email stored was: ${storage.read('email')}');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
