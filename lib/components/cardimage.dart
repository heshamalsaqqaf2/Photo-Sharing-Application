import 'package:flutter/material.dart';
import 'package:yemen_gallary/constant/linkapi.dart';

class CardImages extends StatelessWidget {
  final void Function()? ontap;
  final void Function()? onedit;
  final void Function()? onDelete;
  final String imagenames;

  const CardImages({
    Key? key,
    this.ontap,
    required this.onedit,
    required this.onDelete,
    required this.imagenames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        color: Color.fromARGB(255, 242, 242, 242),
        shadowColor: Color.fromARGB(255, 176, 174, 174),
        elevation: 4,
        child: Container(
          child: Image.network(
            "$linkImageRoot/$imagenames",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
