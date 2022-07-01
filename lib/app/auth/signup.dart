// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yemen_gallary/components/crud.dart';
import 'package:yemen_gallary/components/customtextform.dart';
import 'package:yemen_gallary/components/inputemail.dart';
import 'package:yemen_gallary/components/inputpassword.dart';
import 'package:yemen_gallary/components/valid.dart';
import 'package:yemen_gallary/constant/linkapi.dart';
import 'package:yemen_gallary/errors/controller/base_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with BaseController {
  GlobalKey<FormState> formstate = GlobalKey();
  final Crud _crud = Crud(); // Private Variabual => _
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // Start Function Signup Create Accounts //
  signUp() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await _crud.postRequest(linkSignUp, {
        "username": username.text,
        "email": email.text,
        "password": password.text
      }).catchError(handleError);
      isLoading = false;
      setState(() {});
      if (response == 'null') return;
      if (response['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("success", (route) => false);
      } else {
        print("SignUp Fail");
      }
    }
  }
  // End Function Signup Create Accounts //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Form(
                    key: formstate,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        SvgPicture.asset(
                          "assets/images/subscriber_re_om92.svg",
                          width: 200,
                          fit: BoxFit.contain,
                          alignment: Alignment.topCenter,
                        ),
                        SizedBox(height: 30),
                        CustomTextFormSign(
                          hint: "hesham142",
                          label: "Username",
                          iconInputText: Icon(
                            Icons.person,
                            color: Color(0xFF592CFB),
                          ),
                          mycontroller: username,
                          valid: (val) {
                            return validInput(val!, 3, 20);
                          },
                        ),
                        InputEmail(
                          emailcontroller: email,
                          valid: (val) {
                            return validInput(val!, 10, 40);
                          },
                        ),
                        InputPassword(
                          mycontroller: password,
                          valid: (val) {
                            return validInput(val!, 8, 20);
                          },
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.3)),
                          ),
                          color: Color(0xFF592CFB),
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 70),
                          onPressed: () async {
                            await signUp();
                          },
                          child: Text("SignUp"),
                        ),
                        Container(height: 10),
                        InkWell(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed("login");
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
