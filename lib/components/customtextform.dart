import 'package:flutter/material.dart';

class CustomTextFormSign extends StatelessWidget {
  final TextEditingController mycontroller;
  final Icon iconInputText;
  final String? Function(String?) valid;
  final String hint;
  final String label;

  const CustomTextFormSign({
    Key? key,
    required this.mycontroller,
    required this.valid,
    required this.hint,
    required this.label,
    required this.iconInputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18),
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle:
              TextStyle(color: Color(0xFF592CFB), fontWeight: FontWeight.bold),
          prefixIcon: iconInputText,
        ),
        cursorColor: Color(0xFF592CFB),
      ),
    );
  }
}
