// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yemen_gallary/app/photo/contentpost.dart';
import 'package:yemen_gallary/app/photo/edit.dart';
import 'package:yemen_gallary/components/cardimage.dart';
import 'package:yemen_gallary/components/crud.dart';
import 'package:yemen_gallary/components/pageimage.dart';
import 'package:yemen_gallary/constant/linkapi.dart';
import 'package:yemen_gallary/errors/controller/base_controller.dart';
import 'package:yemen_gallary/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with BaseController {
  // Start Function Get Images //
  getImages() async {
    var response = await Crud().postRequest(linkViewImages, {
      "id": sharedPreferences.getString("id"),
    }).catchError(handleError);
    if (response == null) return;
    return response;
  }
  // End Function Get Images //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              sharedPreferences.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
            },
            icon: Icon(
              Icons.logout,
              color: Color(0xFF592CFB),
            ),
          ),
        ],
        title: const Text(
          "HOME",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF592CFB),
        onPressed: () {
          Navigator.of(context).pushNamed("addimage");
        },
        child: Icon(
          Icons.add_a_photo_outlined,
          color: Color(0xFFFFFFFF),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            FutureBuilder(
                future: getImages(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == "fail") {
                      return Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 80),
                                child: SvgPicture.asset(
                                  "assets/images/folder_files_re_2cbm.svg",
                                  width: 260,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                              SizedBox(height: 35),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 45, top: 5, bottom: 10, right: 20),
                                  child: Text(
                                    "Oops Not Images in Database But Can Not Display Images Application Becouse Not Add Image Any Users! But Can You Added Any Image in Apps Go To The Icon + For Add Image in This Application. \n\n\n\n        Thanks Mr | USERS ",
                                    style: TextStyle(
                                      textBaseline: TextBaseline.ideographic,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 33, 32, 32),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return StaggeredGridView.countBuilder(
                        staggeredTileBuilder: (index) => index % 7 == 0
                            ? StaggeredTile.count(2, 2)
                            : StaggeredTile.count(1, 1),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, i) {
                          return CardImages(
                              onDelete: () async {
                                var response = await Crud().postRequest(
                                  linkDeleteImages,
                                  {
                                    "id": snapshot.data['data'][i]['images_id']
                                        .toString(),
                                    "imagename": snapshot.data['data'][i]
                                            ['images_name']
                                        .toString(),
                                  },
                                ).catchError(handleError);
                                if (response == null) return;
                                if (response['status'] == "success") {
                                  Navigator.of(context)
                                      .pushReplacementNamed("home");
                                } else {
                                  print("Errors: ");
                                }
                              },
                              ontap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ContentPost(
                                        imageshow:
                                            "${snapshot.data['data'][i]['images_name']}",
                                        title:
                                            "${snapshot.data['data'][i]['images_title']}",
                                        description:
                                            "${snapshot.data['data'][i]['images_description']}")));
                              },
                              onedit: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditImages(
                                        images: snapshot.data['data'][i])));
                              },
                              imagenames:
                                  "${snapshot.data['data'][i]['images_name']}");
                        });
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        margin: EdgeInsets.only(top: 200),
                        alignment: Alignment.center,
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Color.fromARGB(255, 104, 102, 107),
                            color: Color(0xFF592CFB),
                            semanticsLabel: "Loading...",
                          ),
                        ));
                  }
                  return Container(
                      child: Center(
                    child: Column(
                      children: const [
                        SizedBox(height: 16),
                        NewCardLoading(),
                        SizedBox(height: 16),
                        NewCardLoading(),
                        SizedBox(height: 16),
                        NewCardLoading(),
                        SizedBox(height: 16),
                        NewCardLoading(),
                        SizedBox(height: 16),
                        NewCardLoading(),
                      ],
                    ),
                  ));
                })
          ],
        ),
      ),
    );
  }
}
