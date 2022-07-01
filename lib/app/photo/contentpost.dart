import 'package:flutter/material.dart';
import 'package:yemen_gallary/constant/linkapi.dart';

class ContentPost extends StatelessWidget {
  final imageshow;
  final title;
  final description;
  const ContentPost({Key? key, this.imageshow, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            // Start View Image //
            PageView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "$linkImageRoot/$imageshow",
                        )),
                  ),
                ),
              ],
            ),
            // End View Image //

            // Start Custom Button Icons //
            SafeArea(
              child: Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 57.6,
                        width: 57.6,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Color(0x080a0928),
                        ),
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      child: Icon(Icons.download_for_offline),
                    ),
                  ],
                ),
              ),
            ),
            // Start Custom Button Icons //

            // Start Content Images //
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 346.8,
                margin: EdgeInsets.only(left: 28.8, bottom: 48, right: 28.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        "$title",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 45.6,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        "$description",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16.2,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 48),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: <Widget>[

                    //     Column(
                    //       children: [
                    //         Container(
                    //           height: 62.4,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(9.6),
                    //             color: Colors.white,
                    //           ),
                    //           child: Align(
                    //             alignment: Alignment.center,
                    //             child: Padding(
                    //               padding: EdgeInsets.only(
                    //                 left: 28.8,
                    //                 right: 28.8,
                    //               ),
                    //               child: Text(
                    //                 'Download',
                    //                 // style: GoogleFonts.lato(
                    //                 //   fontSize: 19.2,
                    //                 //   fontWeight: FontWeight.w700,
                    //                 //   color: Colors.black,
                    //                 // ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            // End Content Images //
          ],
        ),
      ),
    );
  }
}
