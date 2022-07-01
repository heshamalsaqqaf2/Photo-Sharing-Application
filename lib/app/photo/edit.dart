import 'package:flutter/material.dart';
import 'package:yemen_gallary/components/crud.dart';
import 'package:yemen_gallary/components/customtextform.dart';
import 'package:yemen_gallary/components/valid.dart';
import 'package:yemen_gallary/constant/linkapi.dart';
import 'package:yemen_gallary/errors/controller/base_controller.dart';

class EditImages extends StatefulWidget {
  final images;
  const EditImages({Key? key, this.images}) : super(key: key);

  @override
  _EditImagesState createState() => _EditImagesState();
}

class _EditImagesState extends State<EditImages> with BaseController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isLoading = false;

  editImage() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await Crud().postRequest(linkEditImages, {
        "title": title.text,
        "description": description.text,
        "id": widget.images['images_id'],
      }).catchError(handleError);
      isLoading = false;
      setState(() {});
      if (response == null) return;
      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed("home");
      } else {}
    }
  }

  @override
  void initState() {
    title.text = widget.images['images_title'];
    description.text = widget.images['images_description'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              // margin: EdgeInsets.only(top: 80),
              padding: EdgeInsets.all(10),
              child: Form(
                key: formstate,
                child: ListView(
                  children: [
                    SizedBox(height: 80),
                    CustomTextFormSign(
                        hint: "Name Photography",
                        label: "Name",
                        iconInputText: Icon(Icons.supervised_user_circle_sharp),
                        mycontroller: title,
                        valid: (val) {
                          return validInput(val!, 3, 30);
                        }),
                    CustomTextFormSign(
                        label: "Discription",
                        hint: "Content Images",
                        iconInputText: Icon(Icons.description),
                        mycontroller: description,
                        valid: (val) {
                          return validInput(val!, 10, 255);
                        }),
                    Container(height: 20),
                    IconButton(
                      onPressed: () async {
                        await editImage();
                      },
                      icon: Icon(Icons.edit),
                      color: Color(0xFF662EF5),
                      iconSize: 50,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
