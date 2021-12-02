import 'package:booking_theater/locator.dart';
import 'package:booking_theater/router.dart';
import 'package:booking_theater/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var _mail = prefs.getString(constMail);
  var _tel = prefs.getString(constTel);
  var _id = prefs.getString(constID);
  var _userType = prefs.getString(constType);

  setupLocator();
  if(_mail != null && _tel != null && _id != null && _userType != null){ //if User already register, goto Dashboard
     runApp(MyApp(route: homeRoute,));
  }else{// else goto onscreen
    runApp(MyApp(route: onscreenRoute,));
  }
}

class MyApp extends StatelessWidget {
  String route;
  MyApp({ @required this.route});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking Theater',
      onGenerateRoute: Router.generateRoute,
      initialRoute:route,
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
    );
  }
}
