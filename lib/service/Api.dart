import 'dart:convert';

import 'package:booking_theater/locator.dart';
import 'package:booking_theater/model/MoviesModel.dart';
import 'package:booking_theater/model/Notification.dart';
import 'package:booking_theater/service/BaseApi.dart';
import 'package:booking_theater/service/baseUrl.dart';
import 'package:booking_theater/shared/customFunction.dart';
import 'package:booking_theater/style/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var url = locator<BaseURL>();
var custom = locator<CustomFunction>();
class Api extends BaseApi{

  @override
  Future<MoviesModel> getAllMovies()async{
    await Future.delayed(Duration(seconds: 1));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var map = Map<String, String>();
    map['email'] =  prefs.getString(constMail);
    map['phoneno'] =  prefs.getString(constTel);

    var response = await http.post(url.allMoviesUrl, body: map);
    var convert = json.decode(response.body);
    //print(response.body);
    if(convert.toString().isNotEmpty){
      MoviesModel moviesModel = MoviesModel.fromJson(convert);
      return moviesModel;
    }else{
      return null;
    }
  }

  @override
  Future<NotificationModel> getNotification() async{
    await Future.delayed(Duration(seconds: 1));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var map = Map<String, String>();
    map['email'] =  prefs.getString(constMail);
    map['phoneno'] =  prefs.getString(constTel);

    var response = await http.post(url.notificationUrl, body: map);
    var convert = json.decode(response.body);
    //print(response.body);
    if(convert.toString().isNotEmpty){
      NotificationModel notificationModel = NotificationModel.fromJson(convert);
      return notificationModel;
    }else{
      return null;
    }
  }

}