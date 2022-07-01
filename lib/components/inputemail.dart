import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  final TextEditingController emailcontroller;
  final String? Function(String?) valid;

  const InputEmail({
    Key? key,
    required this.emailcontroller,
    required this.valid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18),
      margin: EdgeInsets.only(bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: TextFormField(
                validator: valid,
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Color(0xFF592CFB),
                  ),
                  labelStyle: TextStyle(
                      color: Color(0xFF592CFB), fontWeight: FontWeight.bold),
                ),
                cursorColor: Color(0xFF592CFB),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
