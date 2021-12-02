import 'package:booking_theater/service/Api.dart';
import 'package:booking_theater/service/baseUrl.dart';
import 'package:booking_theater/shared/customFunction.dart';
import 'package:booking_theater/style/text.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BaseURL());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => CustomFunction());
}
