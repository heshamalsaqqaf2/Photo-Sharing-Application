import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yemen_gallary/app/auth/login.dart';
import 'package:yemen_gallary/app/auth/signup.dart';
import 'package:yemen_gallary/app/auth/successfuly.dart';
import 'package:yemen_gallary/app/home.dart';
import 'package:yemen_gallary/app/photo/add.dart';
import 'package:yemen_gallary/app/photo/contentpost.dart';
import 'package:yemen_gallary/app/photo/edit.dart';
import 'package:yemen_gallary/screen_onborder/constants/themes.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHP Rest API',
      theme: theme(),
      initialRoute:
          sharedPreferences.getString("id") == null ? "login" : "home",
      routes: {
        "home": (context) => Home(),
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "success": (context) => SuccessCreatAccount(),
        "addimage": (context) => AddImages(),
        "editimage": (context) => EditImages(),
        "contentpost": (context) => ContentPost(),
      },
    );
  }
}
