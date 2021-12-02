import 'dart:async';

import 'package:booking_theater/Ui/FilmInfoScreen.dart';
import 'package:booking_theater/enum/CategoryType.dart';
import 'package:booking_theater/locator.dart';
import 'package:booking_theater/model/MoviesModel.dart';
import 'package:booking_theater/model/Notification.dart';
import 'package:booking_theater/model/category.dart';
import 'package:booking_theater/service/Api.dart';
import 'package:booking_theater/style/text.dart';
import 'package:booking_theater/style/theme.dart';
import 'package:booking_theater/widgets/NotifyView.dart';
import 'package:booking_theater/widgets/noInternet.dart';
import 'package:booking_theater/widgets/popularFilmsListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';

CategoryType categoryType = CategoryType.movie;

var api = locator<Api>();
class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with TickerProviderStateMixin{
  StreamController<NotificationModel> _notifyController;

  @override
  void initState() {
    _notifyController = new StreamController();
  Timer.periodic(Duration(seconds: 1), (_) => notify(streamController: _notifyController));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return FutureBuilder<MoviesModel>(
      future: api.getAllMovies(),
      builder: (BuildContext context, AsyncSnapshot<MoviesModel> movieSnapshot) {
        if(!movieSnapshot.hasData){
          return custom.movieSkeleton();
        }else{
          return StreamBuilder<NotificationModel>(
            stream: _notifyController.stream,
           builder: (BuildContext context, AsyncSnapshot<NotificationModel> notifySnapshot){
              if(notifySnapshot.data == null){
                return custom.movieSkeleton();
              }else{
                return MultiProvider(
                  providers:[
                    ChangeNotifierProvider(builder: (context) => movieSnapshot.data,), //Providers for WeatherInfo
                    ChangeNotifierProvider(builder: (context) => notifySnapshot.data,),
                //    ChangeNotifierProvider(builder: (context) => CategoryTab(),),//Providers for WeatherInfo
                    //Providers for WeatherInfo
                  ],
                  child: Scaffold(
                      resizeToAvoidBottomPadding: false,
                      backgroundColor: Colors.transparent,
                      body: OfflineBuilder(
                          connectivityBuilder: (
                              BuildContext context, ConnectivityResult connectivity, Widget child,) {
                            final bool connected = connectivity != ConnectivityResult.none;
                            return  Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                    color: connected ? Colors.transparent : Color(0xFFEE4400),
                                    child: (connected ? Stack(
                                      children: <Widget>[
                                        body()
                                      ],
                                    ) : NoInternetWidgets())
                                ),
                              ],
                            );
                          },
                          child: Container()
                      )),
                );
              }
    }
);
        }
      },
    );

  }

  body(){
    return  FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        } else {
          return  Container(
            color: AppColor.nearlyWhite,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  getAppBarUI(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: NotifyView(),
                  ),
                  getCategoryUI(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: <Widget>[
                            Flexible(
                              child: getPopularCourseUI(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget getPopularCourseUI() {
   // var category = Provider.of<CategoryTab>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Movies",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.27,
              color: AppColor.darkerText,
            ),
          ),
//          (category.change == 0 ?
//          Flexible(
//            child: PopularCourseListView(
//              callBack: () {
//                moveTo();
//              },
//            ),
//          ) :
//          Center(child: Text('Booke Mvie')))
          Flexible(
            child: PopularCourseListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilmInfoScreen(),
      ),
    );
  }
  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getCategoryUI() {
    //var category = Provider.of<CategoryTab>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            "Category",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.27,
              color: AppColor.darkerText,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(CategoryType.movie, categoryType == CategoryType.movie),// category),
              SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.bookSeat, categoryType == CategoryType.bookSeat ),// category),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected, ) { //CategoryTab category
    var txt = '';
    if (CategoryType.movie == categoryTypeData) {
      txt = 'Movies';
    } else if (CategoryType.bookSeat == categoryTypeData) {
      txt = 'Book Seat';
    }
    return Expanded(
      child: Container(
        decoration: new BoxDecoration(
            color: isSelected
                ? AppColor.d
                : AppColor.nearlyWhite,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            border: new Border.all(color: AppColor.d)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
//              setState(() {
//                categoryType = categoryTypeData;
//              });
              if(categoryTypeData == CategoryType.movie){
              //  category.change = 0; //for Movie;
              }else if(categoryTypeData == CategoryType.bookSeat){
               // category.change = 1; //for BookSeat;
              }
            },
            child: Padding(
              padding:
              EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? AppColor.nearlyWhite
                        : AppColor.d,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getAppBarUI() {

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppText.welcome + ' Abdullah,' + ' to',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  AppText.appName + ' Cinema',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/images/logo.jpg'),
          )
        ],
      ),
    );
  }

  Widget getNotificationUI() {
    return NotifyView();
  }

  notify({StreamController<NotificationModel> streamController}){
    api.getNotification().then((res) async {
      streamController.add(res);
      return res;
    });
  }
}
