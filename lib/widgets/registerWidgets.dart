import 'dart:convert';

import 'package:booking_theater/locator.dart';
import 'package:booking_theater/service/baseUrl.dart';
import 'package:booking_theater/shared/customFunction.dart';
import 'package:booking_theater/style/constants.dart';
import 'package:booking_theater/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


var custom = locator<CustomFunction>();
var url = locator<BaseURL>();

class RegisterWidgets extends StatefulWidget {
  @override
  _RegisterWidgetsState createState() => _RegisterWidgetsState();
}

class _RegisterWidgetsState extends State<RegisterWidgets> {
  bool _obscureRegistra = true;
  List<String> userType = new List<String>();
  String _seletUsertype;
  bool processing = false;
  TextEditingController fullNameController, emailController, phonenoController,
      companyNController, passwordContoller1, passwordContoller2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.10), BlendMode.dstATop),
              image: AssetImage('assets/images/showtime.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child:  Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: Image.asset('assets/images/logo.jpg', width: 100,)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: new Stack(fit: StackFit.loose, children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                      new Container(
//                          width: 140.0,
//                          height: 140.0,
//                          decoration: new BoxDecoration(
//                            shape: BoxShape.circle,
//                            image: new DecorationImage(
//                              image: new ExactAssetImage(
//                                  'assets/images/userimg.png'),
//                              fit: BoxFit.cover,
//                            ),
//                          )),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Full name",
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
                        controller: fullNameController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Olajire Abdullah',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: AppTextStyles.inputStyle(context),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Email",
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
                        controller: emailController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'horlaz229@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: AppTextStyles.inputStyle(context),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10.0,
              ),
               Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Phone Number",
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
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        controller: phonenoController,
                        style: AppTextStyles.inputStyle(context),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '+2348185xxxxx',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Company Name",
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
                        controller: companyNController,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.inputStyle(context),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'e.g yourcompanyname',
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
                        "Password",
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
                        controller: passwordContoller1,
                        obscureText: _obscureRegistra,
                        style: AppTextStyles.inputStyle(context),
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '******',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: _See_Reg_password,
                            child: Icon(
                              FontAwesomeIcons.eye,
                              size: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Retype Password",
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
                        obscureText: _obscureRegistra,
                        style: AppTextStyles.inputStyle(context),
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        controller: passwordContoller2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '******',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: _See_Reg_password,
                            child: Icon(
                              FontAwesomeIcons.eye,
                              size: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10.0,
              ),
               Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Register as",
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
                      child: DropdownButton<String>(
                        elevation: 6,
                        style: AppTextStyles.inputStyle(context),
                        hint: Text(
                          "Choose type",
                          textAlign: TextAlign.center,
                        ),
                        value: _seletUsertype,
                        onChanged: (String value) {
                          setState(() {
                            _seletUsertype = value;
                          });
                        },
                        items: userType.map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  val.toString(),
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        isExpanded: true,
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
                const EdgeInsets.only(left: 70.0, right: 70.0, top: 30.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        color: Colors.redAccent,
                        onPressed: (){
                          registerAPI();
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
                                  "SIGN UP",
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
              SizedBox(height: 25.0,)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    userType.add('Officer');
    userType.add('JCO/OR');
    fullNameController = TextEditingController();
    phonenoController = TextEditingController();
    companyNController = TextEditingController();
    passwordContoller1 = TextEditingController();
    passwordContoller2 = TextEditingController();
    emailController = TextEditingController();

    super.initState();
  }

  void _See_Reg_password() {
    setState(() {
      _obscureRegistra = !_obscureRegistra;
    });
  }

  registerAPI()async{

    String fullName = fullNameController.text.trim();
    String email = emailController.text.trim();
    String phoneno = phonenoController.text.trim();
    String company = companyNController.text.trim();
    String password1 = passwordContoller1.text.trim();
    String pasword2 = passwordContoller2.text.trim();

    if(fullName.isEmpty || phoneno.isEmpty || company.isEmpty || email.isEmpty){
      custom.showToast(message: 'Name is required!');

    }else if(password1.toString() != pasword2.toString()){
      custom.showToast(message: 'Password not match');

    }else{
      String fullName = fullNameController.text.trim();
      String phoneno = phonenoController.text.trim();
      String usermail = emailController.text.trim();
      String company = companyNController.text.trim();
      String password1 = passwordContoller1.text.trim();
      String pasword2 = passwordContoller2.text.trim();

      startloading();
      var map = new Map<String, String>();
      map["name"] = fullName;
      map["email"] = usermail;
      map["phoneno"] = phoneno;
      map["pass"] = password1;
      map["cpass"] = pasword2;
      map["cpass"] = pasword2;
      map["user_type"] = _seletUsertype;
      map["cname"] = company;


      var response = await http.post(url.registerUrl, body: map);
      var convertDataToJson = json.decode(response.body);
      bool status = convertDataToJson["status"];
      String responseId = convertDataToJson['id'];
      String responseEmail = convertDataToJson['email'];
      String responsePhone = convertDataToJson['phoneno'];
      String responseUserType = convertDataToJson['type'];
      String msg = convertDataToJson['msg'];

      if(status){
        stoploading();
        custom.storeLoginResponse(email:responseEmail, phoneNumber: responsePhone, usertype: responseUserType, id: responseId);
        custom.showToast(message: msg);
        Navigator.pushReplacementNamed(context, homeRoute);

      }else{
        custom.showToast(message: msg);
        stoploading();
      }
      stoploading();
    }
  }

  startloading() {
    setState(() {
      processing = true;
    });
  }

  stoploading() {
    setState(() {
      processing = false;
    });
  }

}