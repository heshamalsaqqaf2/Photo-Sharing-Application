import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

//  Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: onDelete,
//                             icon: Icon(
//                               Icons.delete,
//                               color: Colors.white,
//                             )),
//                          Container(
//                            child: Text(
//                              "Delete",
//                              style: TextStyle(color: Colors.white),
//                            ),
//                          ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: onedit,
//                           icon: Icon(Icons.edit),
//                           color: Colors.white,
//                         ),
//                         Container(
//                           child: Text(
//                             "Edit",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),