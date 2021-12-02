import 'package:booking_theater/locator.dart';
import 'package:booking_theater/style/constants.dart';
import 'package:booking_theater/style/text.dart';
import 'package:booking_theater/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';


class OnscreenView extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: AppColor.launchColor1,
      bubbleBackgroundColor: Color(0xFFF47D90),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(AppText.launch_text1, style: TextStyle( fontFamily: "Metropolis",),),
          SizedBox(height: 5.0,),
          Text(
            AppText.launch_text1b,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
              fontFamily: "SourceCodePro",
              fontFamilyFallback: ["SourceCodePro-Medium"],
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        AppImage.launchImage1,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: AppColor.launchColor2,
        iconColor: null,
        bubbleBackgroundColor: Color(0xFFDCD9D9),
        title: Container(),
        body: Column(
          children: <Widget>[
            Text(AppText.launch_text2, style: TextStyle( fontFamily: "Metropolis",
            color: Colors.white70),),
            SizedBox(height: 5.0,),
            Text(
              AppText.launch_text2b,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontFamily: "SourceCodePro",
                fontFamilyFallback: ["SourceCodePro-Medium"],
              ),
            ),
          ],
        ),
        mainImage: Image.asset(
          AppImage.launchImage2,
          width: 285.0,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: AppColor.launchColor3,
        iconColor: null,
      bubbleBackgroundColor: AppColor.secondaryColor,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text(AppText.launch_text3, style: TextStyle( fontFamily: "Metropolis", color: Colors.white),),
            SizedBox(height: 5.0,),
            Text(
              AppText.launch_text3b,
              style: TextStyle(
                  fontFamily: "SourceCodePro",
                  fontFamilyFallback: ["SourceCodePro-Medium"],
                color: Colors.grey,
                fontSize: 16.0
              ),
            ),
          ],
        ),
        mainImage: Image.asset(
          AppImage.launchImage3,
          width: 285.0,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: (){
                Navigator.pushReplacementNamed(context, loginRegisterRoute);
              },
              showSkipButton: false,
              doneText: Text("Get Started",),
              pageButtonsColor: Colors.grey,
              pageButtonTextStyles: new TextStyle(
                  // color: Colors.indigo,
                  fontSize: 16.0,
                  fontFamily: "Regular",
              ),
            ),
            Positioned(
              top: 20.0,
              left: MediaQuery.of(context).size.width/2 - 50,
              child: Image.asset('assets/images/logo.jpg', width: 100,)
            )
          ],
        ),
      ),
    );
  }
}