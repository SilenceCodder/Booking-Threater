//import 'package:booking_theater/style/theme.dart';
//import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//
//class HomeView extends StatefulWidget {
//  final AnimationController animationController;
//  const HomeView({Key key, this.animationController}) : super(key: key);
//
//  @override
//  _HomeViewState createState() => _HomeViewState();
//}
//
//class _HomeViewState extends State<HomeView> {
//  Animation<double> topBarAnimation;
//  var scrollController = ScrollController();
//  double topBarOpacity = 0.0;
//  String formattedDate;
//  List<Widget> listViews = List<Widget>();
//
//
//  @override
//  void initState() {
//    todaysDate();
//    topBarAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//        parent: widget.animationController,
//        curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
//
//    scrollController.addListener(() {
//      if (scrollController.offset >= 24) {
//        if (topBarOpacity != 1.0) {
//          setState(() {
//            topBarOpacity = 1.0;
//          });
//        }
//      } else if (scrollController.offset <= 24 &&
//          scrollController.offset >= 0) {
//        if (topBarOpacity != scrollController.offset / 24) {
//          setState(() {
//            topBarOpacity = scrollController.offset / 24;
//          });
//        }
//      } else if (scrollController.offset <= 0) {
//        if (topBarOpacity != 0.0) {
//          setState(() {
//            topBarOpacity = 0.0;
//          });
//        }
//      }
//    });
//    super.initState();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//
//  void addAllListData() {
//    var count = 9;
//
//  }
//  Future<bool> getData() async {
//    await Future.delayed(const Duration(milliseconds: 50));
//    return true;
//  }
//
//  Widget getMainListViewUI() {
//    return FutureBuilder(
//      future: getData(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return SizedBox();
//        } else {
//          return ListView.builder(
//            controller: scrollController,
//            padding: EdgeInsets.only(
//              top: AppBar().preferredSize.height +
//                  MediaQuery.of(context).padding.top +
//                  24,
//              bottom: 62 + MediaQuery.of(context).padding.bottom,
//            ),
//            itemCount: listViews.length,
//            scrollDirection: Axis.vertical,
//            itemBuilder: (context, index) {
//              widget.animationController.forward();
//              return listViews[index];
//            },
//          );
//        }
//      },
//    );
//  }
//
//  Widget getAppBarUI() {
//    return Column(
//      children: <Widget>[
//        AnimatedBuilder(
//          animation: widget.animationController,
//          builder: (BuildContext context, Widget child) {
//            return FadeTransition(
//              opacity: topBarAnimation,
//              child: new Transform(
//                transform: new Matrix4.translationValues(
//                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
//                child: Container(
//                  decoration: BoxDecoration(
//                    color: Colors.blue, //Colors.blueAccent.withOpacity(topBarOpacity),
//                    borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(32.0),
//                    ),
//                    boxShadow: <BoxShadow>[
//                      BoxShadow(
//                          color: AppColor.primaryDarkColor
//                              .withOpacity(0.4 * topBarOpacity),
//                          offset: Offset(1.1, 1.1),
//                          blurRadius: 10.0),
//                    ],
//                  ),
//                  child: Column(
//                    children: <Widget>[
//                      SizedBox(
//                        height: MediaQuery.of(context).padding.top,
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(
//                            left: 16,
//                            right: 16,
//                            top: 16 - 8.0 * topBarOpacity,
//                            bottom: 12 - 8.0 * topBarOpacity),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Expanded(
//                              child: Padding(
//                                  padding: const EdgeInsets.all(2.0),
//                                  child: Image.asset('assets/images/logo.png', height: 45.0,
//                                    width: 50.0, alignment: Alignment.topLeft,)
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.only(
//                                left: 9,
//                              ),
//                              child: Row(
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.only(right: 8),
//                                    child: Icon(
//                                      Icons.calendar_today,
//                                      color: Colors.white,
//                                      size: 18,
//                                    ),
//                                  ),
//                                  Text(
//                                    (formattedDate == null ? '' : formattedDate),
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                      fontWeight: FontWeight.normal,
//                                      fontSize: 18,
//                                      letterSpacing: -0.2,
//                                      color: Colors.white,
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            SizedBox(
//                              height: 38,
//                              width: 18,
//                              child: InkWell(
//                                highlightColor: Colors.transparent,
//                                borderRadius:
//                                BorderRadius.all(Radius.circular(32.0)),
//                                onTap: () {
//                                  print('Hi');
//                                  //DashboardScreen(animationController: widget.animationController);
//                                },
////                                child: Center(
////                                  child: Icon(
////                                    Icons.arrow_forward_ios,
////                                    color: DropsAppTheme.grey,
////                                  ),
////                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//            );
//          },
//        )
//      ],
//    );
//  }
//
//  todaysDate(){
//    var now = new DateTime.now();
//    var formatter = new DateFormat('dd MMMM');
//    formattedDate = formatter.format(now);
//  }
//}
