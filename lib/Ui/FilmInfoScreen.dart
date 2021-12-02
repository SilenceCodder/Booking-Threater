import 'dart:convert';

import 'package:booking_theater/style/constants.dart';
import 'package:booking_theater/style/theme.dart';
import 'package:booking_theater/widgets/registerWidgets.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FilmInfoScreen extends StatefulWidget {
  final bool isBooked;
   final String imagePath, title, duration, seats, remain, description, director, cast;
   final List<int> listSeats;
   final String movieId;

   const FilmInfoScreen(
       {Key key, this.imagePath, this.title, this.duration, this.seats,
         this.remain, this.description, this.director, this.isBooked, this.cast, this.listSeats, this.movieId})
       : super(key: key);


  @override
  _FilmInfoScreenState createState() => _FilmInfoScreenState();
}

class _FilmInfoScreenState extends State<FilmInfoScreen>
    with TickerProviderStateMixin {
  final infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;
  List<int> seatsNumbers = new List<int>();
  int selectedNumber, haveChoose = 0;
  bool processing = false;

  @override
  void initState() {
    seatsNumbers = widget.listSeats;
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  void setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tempHight = (MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 1.2) + 24.0);
    return Container(
      color: AppColor.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: (widget.imagePath == null ? Image.asset('assets/images/m1.jpg', fit: BoxFit.cover,)
                      : FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: widget.imagePath, fit: BoxFit.cover,
                  ))
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.nearlyWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppColor.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight:
                              tempHight > infoHeight ? tempHight : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                                (widget.title == null ? ' ' : widget.title),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: AppColor.darkerText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  (widget.cast == null ? ' ' : 'Cast: ${widget.cast}'),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    letterSpacing: 0.27,
                                    color: AppColor.d,
                                  ),
                                ),
                                Container(
                                  child: (widget.isBooked ?
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Already booked",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 15,
                                          letterSpacing: 0.27,
                                          color: AppColor.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: AppColor.d,
                                        size: 24,
                                      ),
                                    ],
                                  ) :
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15, top: 1.0),
                                        child: FindDropdown(
                                          items: seatsNumbers,
                                          label: "Select Seat Number",
                                            labelStyle: TextStyle(
                                          fontSize: 13.0
                                        ),
                                          onChanged: (value){
                                            selectedNumber = value;
                                            setState(() {
                                              haveChoose = 1;
                                            });
                                          },
                                          selectedItem: 0,
                                          validate: (int item) {
                                           return '';
                                          },
                                        ),
                                      ),
                                    ],
                                  ))
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: opacity1,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                children: <Widget>[
                                  getTimeBoxUI((widget.seats == null ? '' : widget.seats.toString()), "Seats"),
                                  getTimeBoxUI((widget.duration == null ? '' : widget.duration.toString()), "Time"),
                                  getTimeBoxUI((widget.remain == null ? '' : widget.remain.toString()), "Seats Remain"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        (widget.description == null ? ' ' : widget.description),
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 14,
                                          letterSpacing: 0.27,
                                          color: AppColor.grey,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        (widget.director == null ? ' ' :
                                        'Director: ${widget.description}'),
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          letterSpacing: 0.27,
                                          color: AppColor.primaryColor,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.nearlyWhite,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        border: new Border.all(
                                            color: AppColor.grey
                                                .withOpacity(0.2)),
                                      ),
                                      child: Icon(
                                        Icons.book,
                                        color: AppColor.d,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: (processing ? Center(
                                      child: SpinKitHourGlass(color: AppColor.d),):
                                    (widget.isBooked ? GestureDetector(
                                      child: Container(
                                        height: 48, decoration: BoxDecoration(
                                          color: AppColor.d,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(color: AppColor.d.withOpacity(0.5),
                                                offset: Offset(1.1, 1.1),
                                                blurRadius: 10.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Unbook seat",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              color: AppColor.nearlyWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: (){
                                        unBook(id: widget.movieId);
                                      },
                                    ) : GestureDetector(
                                      child:Container(
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: (haveChoose == 0 ? Colors.grey : AppColor.d),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(color: AppColor.d.withOpacity(0.5),
                                                offset: Offset(1.1, 1.1),
                                                blurRadius: 10.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Book seat",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              color: AppColor.nearlyWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: (){
                                        if(haveChoose == 0){
                                          custom.showToast(message: 'You need to Select a Seat number');
                                        }else{
                                          bookSeatAPI(id: widget.movieId);
                                        }
                                      },
                                    ))
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: new ScaleTransition(
                alignment: Alignment.center,
                scale: new CurvedAnimation(
                    parent: animationController, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: (widget.isBooked ? AppColor.d : Colors.grey),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: AppColor.nearlyWhite,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: new BorderRadius.circular(
                        AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.white,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.nearlyWhite,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColor.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppColor.d,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppColor.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bookSeatAPI({String id})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var map = new Map<String, String>();
    map['email'] =  prefs.getString(constMail);
    map['phoneno'] =  prefs.getString(constTel);
    map["seat_no"] = selectedNumber.toString();
    map["movie_id"] = id;
    map["book_status"] = 'true';
    starLoading();

    var response = await http.post(url.bookSeatUrl, body: map);
    var convertDataToJson = json.decode(response.body);
    bool status = convertDataToJson["status"];
    String msg = convertDataToJson['msg'];

    if(status){
      stopLading();
      custom.showToast(message: msg);
      Navigator.pushReplacementNamed(context, homeRoute);
    }else{
      custom.showToast(message: msg);
      stopLading();
    }
    stopLading();
  }

  starLoading(){
    setState(() {
      processing = true;
    });
  }

  stopLading(){
    setState(() {
      processing = false;
    });
  }
  unBook({String id})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var map = new Map<String, String>();
    map['email'] =  prefs.getString(constMail);
    map['phoneno'] =  prefs.getString(constTel);
    map["seat_no"] = selectedNumber.toString();
    map["movie_id"] = id;
    map["book_status"] = 'false';
    starLoading();

    var response = await http.post(url.bookSeatUrl, body: map);
    var convertDataToJson = json.decode(response.body);
    bool status = convertDataToJson["status"];
    String msg = convertDataToJson['msg'];

    if(status){
      stopLading();
      custom.showToast(message: msg);
      Navigator.pushReplacementNamed(context, homeRoute);
    }else{
      custom.showToast(message: msg);
      stopLading();
    }
    stopLading();
  }
}
