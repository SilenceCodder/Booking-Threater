import 'dart:convert';

import 'package:booking_theater/service/Api.dart';
import 'package:booking_theater/service/baseUrl.dart';
import 'package:booking_theater/shared/customFunction.dart';
import 'package:booking_theater/style/constants.dart';
import 'package:booking_theater/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:booking_theater/style/theme.dart' as customColor;
import 'package:booking_theater/widgets/noInternet.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../locator.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


var custom = locator<CustomFunction>();
var url = locator<BaseURL>();

class loginWidget extends StatefulWidget {
  @override
  _loginWidgetState createState() => _loginWidgetState();
}

class _loginWidgetState extends State<loginWidget> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool processing = false;
  var _api = locator<Api>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Ui(),
    );
  }

  Widget Ui(){
    return Scaffold(
      backgroundColor: customColor.AppColor.primaryColor,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: customColor.AppColor.primaryColor,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.10), BlendMode.dstATop),
              image: AssetImage('assets/images/seates.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(80.0),
                child: Center(
                  child: Image.asset('assets/images/logo.jpg', width: 100,)
                ),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "EMAIL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.redAccent,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: mailController,
                        style: AppTextStyles.inputStyle(context),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'horlaz229@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "PASSWORD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.redAccent,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        obscureText: true,
                        style: AppTextStyles.inputStyle(context),
                        controller: passController,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '*********',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10.0,
              ),
              (processing ? custom.loadingWidget() : Container(
                width: MediaQuery.of(context).size.width,
                margin:
                const EdgeInsets.only(left: 70.0, right: 70.0, top: 15.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        color: Colors.redAccent,
                        onPressed: () {
                          loginApi();
                        },
                        child: new Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: Text(
                                  "LOGIN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(height: 20.0,)
            ],
          ),
        ),
      ),
    );
  }


  loginApi()async{
    starLoading();
    String mail = mailController.text.trim();
    String pass = passController.text.trim();
    print(mail);
    print(pass);

    if(mail.isEmpty && pass.isEmpty){
        custom.showToast(message: 'Empty field detected');
    }else{
      starLoading();

      var map = new Map<String, String>();
      map["email"] = mail;
      map["pass"] = pass;

      var response = await http.post(url.loginUrl, body: map);
      var convertDataToJson = json.decode(response.body);
      bool status = convertDataToJson["status"];
      String responseId = convertDataToJson['id'];
      String responseEmail = convertDataToJson['email'];
      String responsePhone = convertDataToJson['phoneno'];
      String responseUserType = convertDataToJson['type'];
      String msg = convertDataToJson['msg'];

      if(status){
        stopLading();
        custom.storeLoginResponse(email:responseEmail, phoneNumber: responsePhone,
            usertype: responseUserType, id: responseId);
        custom.showToast(message: msg);
        Navigator.pushReplacementNamed(context, homeRoute);

      }else{
        custom.showToast(message: msg);
        stopLading();
      }
    }
    stopLading();
  }

  starLoading(){
    setState(() {
      processing = true;
    });
  }

  stopLading(){
    setState(() {
      processing = false;
    });
  }
}
