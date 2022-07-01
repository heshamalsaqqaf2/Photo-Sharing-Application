import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemen_gallary/components/crud.dart';
import 'package:yemen_gallary/components/customtextform.dart';
import 'package:yemen_gallary/components/valid.dart';
import 'package:yemen_gallary/constant/linkapi.dart';
import 'package:yemen_gallary/errors/controller/base_controller.dart';
import 'package:yemen_gallary/main.dart';

class AddImages extends StatefulWidget {
  const AddImages({Key? key}) : super(key: key);

  @override
  _AddImagesState createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> with BaseController {
  File? myfile;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isLoading = false;

  addImage() async {
    if (myfile == null) {
      return AwesomeDialog(
        context: context,
        title: "Worning",
        body: Text("Please Choose One Image"),
      )..show();
    }
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await Crud()
          .postRequestFile(
            linkAddImages,
            {
              "title": title.text,
              "description": description.text,
              "id": sharedPreferences.getString("id"),
            },
            myfile!,
          )
          .catchError(handleError);
      isLoading = false;
      setState(() {});
      if (response == null) return;
      if (response['status'] == "success") {
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text("Oopse Error!"),
        )..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: formstate,
                child: ListView(
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        "assets/images/server_push_re_303w.svg",
                        width: 230,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormSign(
                        hint: "Name Photography",
                        label: "Name",
                        iconInputText: Icon(
                          Icons.person,
                          color: Color(0xFF592CFB),
                        ),
                        mycontroller: title,
                        valid: (val) {
                          return validInput(val!, 3, 20);
                        }),
                    CustomTextFormSign(
                        label: "Discription",
                        hint: "Content Images",
                        iconInputText: Icon(
                          Icons.description,
                          color: Color(0xFF592CFB),
                        ),
                        mycontroller: description,
                        valid: (val) {
                          return validInput(val!, 10, 100);
                        }),
                    Container(
                      margin: EdgeInsets.only(left: 70, right: 70),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.3)),
                        ),
                        onPressed: () async {
                          showModalBottomSheet(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30)),
                              ),
                              backgroundColor: Color(0xFF592CFB),
                              context: context,
                              builder: (context) => Container(
                                    height: 160,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 15),
                                              child: Text(
                                                  "Choose Images Location",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xFFFFFFFF))),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            XFile? xfile = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            Navigator.of(context).pop();
                                            myfile = File(xfile!.path);
                                            setState(() {});
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.explore,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Gallary",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            XFile? xfile = await ImagePicker()
                                                .pickImage(
                                                    source: ImageSource.camera);
                                            Navigator.of(context).pop();
                                            myfile = File(xfile!.path);
                                            setState(() {});
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.camera_enhance,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Camera",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                        },
                        child: myfile == null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Text("Chose Images"),
                              )
                            : Text("تم اختيار الصورة"),
                        textColor: Colors.white,
                        color: myfile == null
                            ? Color(0xFF592CFB)
                            : Color(0xFFFFDD02),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 70, right: 70, top: 10),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.3)),
                        ),
                        onPressed: () async {
                          await addImage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          child: Text("ADD"),
                        ),
                        textColor: Colors.white,
                        color: Color(0xFF592CFB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
