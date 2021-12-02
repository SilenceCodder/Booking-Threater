import 'package:booking_theater/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:smartchurch/enum/constants.dart';
//import 'package:smartchurch/enum/theme.dart' as mytheme;
//import 'package:fluttertoast/fluttertoast.dart';
//
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CustomFunction{

  showToast({String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  storeLoginResponse({String id, email, phoneNumber, usertype})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(constID, id);
    preferences.setString(constMail, email);
    preferences.setString(constTel, phoneNumber);
    preferences.setString(constType, usertype);
  }

  loadingWidget(){
    return SpinKitRotatingCircle(
      color: Colors.red,
      size: 50.0,
    );
  }

  movieSkeleton(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white70),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SkeletonAnimation(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        SkeletonAnimation(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

