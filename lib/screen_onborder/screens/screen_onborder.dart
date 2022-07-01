import 'package:flutter/material.dart';
import '../constants/sizeconfig.dart';
import 'components/body_onborder.dart';

class OnborderScreen extends StatelessWidget {
  const OnborderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfigOnborder().init(context);
    return Scaffold(
      body: BodyOnborder(),
    );
  }
}
