import 'package:booking_theater/model/MoviesModel.dart';
import 'package:booking_theater/model/Notification.dart';

abstract class BaseApi{
  Future<MoviesModel> getAllMovies();
  Future<NotificationModel> getNotification();
}