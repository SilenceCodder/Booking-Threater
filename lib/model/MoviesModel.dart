import 'package:flutter/foundation.dart';

class MoviesModel with ChangeNotifier {
  bool status;
  String msg;
  List<Movies> movies;

  MoviesModel({this.status, this.msg, this.movies});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['movies'] != null) {
      movies = new List<Movies>();
      json['movies'].forEach((v) {
        movies.add(new Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.movies != null) {
      data['movies'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  String movieId;
  String title;
  String director;
  String cast;
  String description;
  String durationMin;
  String movieImg;
  int no0fSeats;
  String timeToplay;
  bool bookStatus;
  int availableSeats;
  List<int> seatNumbers;

  Movies(
      {this.movieId,
        this.title,
        this.director,
        this.cast,
        this.description,
        this.durationMin,
        this.movieImg,
        this.no0fSeats,
        this.timeToplay,
        this.bookStatus,
        this.availableSeats,
        this.seatNumbers});

  Movies.fromJson(Map<String, dynamic> json) {
    movieId = json['movie_id'];
    title = json['title'];
    director = json['director'];
    cast = json['cast'];
    description = json['description'];
    durationMin = json['duration_min'];
    movieImg = json['movie_img'];
    no0fSeats = json['no0f_seats'];
    timeToplay = json['time_toplay'];
    bookStatus = json['book_status'];
    availableSeats = json['available_seats'];
    seatNumbers = json['seatNumbers'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movie_id'] = this.movieId;
    data['title'] = this.title;
    data['director'] = this.director;
    data['cast'] = this.cast;
    data['description'] = this.description;
    data['duration_min'] = this.durationMin;
    data['movie_img'] = this.movieImg;
    data['no0f_seats'] = this.no0fSeats;
    data['time_toplay'] = this.timeToplay;
    data['book_status'] = this.bookStatus;
    data['available_seats'] = this.availableSeats;
    data['seatNumbers'] = this.seatNumbers;
    return data;
  }
}
