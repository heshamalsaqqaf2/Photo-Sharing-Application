import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessCreatAccount extends StatefulWidget {
  const SuccessCreatAccount({Key? key}) : super(key: key);
  @override
  _SuccessCreatAccountState createState() => _SuccessCreatAccountState();
}

class _SuccessCreatAccountState extends State<SuccessCreatAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              child: SvgPicture.asset(
                "assets/images/completed_re_cisp.svg",
                width: 260,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 35, top: 10, right: 20, bottom: 30),
              child: Text(
                "YOU HART ME MR USER... \n \n The account has been created successfully. You can now go to the login page by clicking on the button below, and you can contact us via e-mail.",
                style: TextStyle(fontSize: 14),
              )),
          SizedBox(
            height: 10,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right,
              size: 50,
            ),
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil("login", (route) => false),
          ),
        ],
      ),
    );
  }
}
