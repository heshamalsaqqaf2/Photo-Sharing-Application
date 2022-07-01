// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yemen_gallary/components/crud.dart';
import 'package:yemen_gallary/components/inputemail.dart';
import 'package:yemen_gallary/components/inputpassword.dart';
import 'package:yemen_gallary/components/valid.dart';
import 'package:yemen_gallary/constant/linkapi.dart';
import 'package:yemen_gallary/errors/controller/base_controller.dart';
import 'package:yemen_gallary/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with BaseController {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Crud crud = Crud();
  bool isLoading = false;

  // Start Function Login Apllication //
  login() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkLogin, {
        "email": email.text,
        "password": password.text,
      }).catchError(handleError);
      isLoading = false;
      setState(() {});

      if (response == null) return;
      if (response['status'] == "success") {
        sharedPreferences.setString("id", response['data']['id'].toString());
        sharedPreferences.setString("username", response['data']['username']);
        sharedPreferences.setString("email", response['data']['email']);
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        AwesomeDialog(
          context: context,
          title: "تنبية",
          body:
              Text("البريد الالكتروني او كلمة السر خاطئة او الحساب غير موجود"),
        )..show();
      }
    }
  }
  // End Function Login Apllication //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Form(
                    key: formstate,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        SvgPicture.asset(
                          "assets/images/mobile_login_re_9ntv.svg",
                          width: 210,
                          fit: BoxFit.contain,
                          alignment: Alignment.topCenter,
                        ),
                        SizedBox(height: 30),
                        InputEmail(
                          valid: (val) {
                            return validInput(val!, 10, 40);
                          },
                          emailcontroller: email,
                        ),
                        InputPassword(
                          valid: (val) {
                            return validInput(val!, 8, 20);
                          },
                          mycontroller: password,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.3)),
                          ),
                          height: 45,
                          minWidth: 220,
                          color: Color(0xFF7049FC),
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 70),
                          onPressed: () async {
                            await login();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: InkWell(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
