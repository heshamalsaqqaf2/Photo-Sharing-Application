import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController mycontroller;
  final String? Function(String?) valid;

  const InputPassword({
    Key? key,
    required this.mycontroller,
    required this.valid,
  }) : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState(valid);
}

class _InputPasswordState extends State<InputPassword> {
  bool passwordVisible = true;
  final String? Function(String?) valid;

  _InputPasswordState(this.valid);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18),
      margin: EdgeInsets.only(bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  counterStyle: TextStyle(color: Color(0xFF592CFB)),
                  prefixIcon: Icon(Icons.lock,
                    color: Color(0xFF592CFB),
                  ),
                  labelStyle: TextStyle(
                      color: Color(0xFF592CFB), fontWeight: FontWeight.bold),
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: Color(0xFF592CFB),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
                cursorColor: Color(0xFF592CFB),
                keyboardType: TextInputType.visiblePassword,
                obscureText: passwordVisible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
