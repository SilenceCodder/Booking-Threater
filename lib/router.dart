//
import 'package:booking_theater/Ui/DashboardView.dart';
import 'package:booking_theater/Ui/OnscreenView.dart';

import 'package:booking_theater/Ui/login_Register_View.dart';
import 'package:booking_theater/style/constants.dart';
import 'package:flutter/material.dart';

////sending dat to next screen
////Navigator.pushNamed(context, feedRoute, arguments: 'Data from home');
////var data = settings.arguments as String;
////return MaterialPageRoute(builder: (_) => Feed(data));
//import 'package:flutter/material.dart';
////import 'package:smartchurch/enum/constants.dart';
////import 'package:booking_theater/ui/dashboardView.dart';
////import 'package:smartchurch/ui/login_Register_View.dart';
//
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onscreenRoute:
        return MaterialPageRoute(builder: (_) => OnscreenView());

    case loginRegisterRoute:
        return MaterialPageRoute(builder: (_) => login_registerView());

      case homeRoute:
        return MaterialPageRoute(builder: (_) => DashboardView());
    }
  }
}
