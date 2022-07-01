import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/custome_buttom.dart';
import '../../constants/constant.dart';
import '../../constants/sizeconfig.dart';
import 'content.dart';

class BodyOnborder extends StatefulWidget {
  @override
  _BodyOnborderState createState() => _BodyOnborderState();
}

class _BodyOnborderState extends State<BodyOnborder> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Welcome to yemen, Let`s images",},
    {
      "text": "We help pepole conect with images \naround Yemen",
      "image": "assets/images/2.svg"
    },
    {
      "text": "We show  the easy way to images, \nJust stay at home with us",
      "image": "assets/images/1.svg"
    },
  ];

// Start Function Shared Prefrances //
  Future setSeenboard() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('seenOnboard', true);
  }
  @override
  void initState() {
    super.initState();
    setSeenboard();
  }
// End Function Shared Prefrances //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    CustomeButton(
                      text: "Continue",
                      press: () {
                        Navigator.of(context).pushReplacementNamed("login");
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function Animation Dot Swap Screens
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
