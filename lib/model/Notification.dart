import 'package:flutter/foundation.dart';

class NotificationModel with ChangeNotifier {
  bool status;
  String msg;
  String title;
  String director;
  String cast;
  String description;
  String durationMin;
  String movieImg;

  NotificationModel(
      {this.status,
        this.msg,
        this.title,
        this.director,
        this.cast,
        this.description,
        this.durationMin,
        this.movieImg});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    title = json['title'];
    director = json['director'];
    cast = json['cast'];
    description = json['description'];
    durationMin = json['duration_min'];
    movieImg = json['movie_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['title'] = this.title;
    data['director'] = this.director;
    data['cast'] = this.cast;
    data['description'] = this.description;
    data['duration_min'] = this.durationMin;
    data['movie_img'] = this.movieImg;
    return data;
  }
}
