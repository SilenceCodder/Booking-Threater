import 'package:booking_theater/model/Notification.dart';
import 'package:booking_theater/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotifyView extends StatefulWidget {

  @override
  _NotifyViewState createState() => _NotifyViewState();
}

class _NotifyViewState extends State<NotifyView> with TickerProviderStateMixin {
  AnimationController animationController;
   Animation animation;

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
//    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//        parent: animationController,
//        curve: Interval((1 / 2) * 0, 1.0, curve: Curves.fastOutSlowIn)));
    var notify = Provider.of<NotificationModel>(context);

    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 24, right: 24, top: 0, bottom: 0),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppColor.grey.withOpacity(0.4),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.0)),
                        child: SizedBox(
                          height: 74,
                          child: AspectRatio(
                            aspectRatio: 1.714,
                            child: Image.asset(
                                "assets/images/back.png", color: AppColor.launchColor1,),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 100,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "It's time for the show!",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color:
                                    AppColor.launchColor1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 100,
                              bottom: 12,
                              top: 4,
                              right: 16,
                            ),
child: RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'The movie ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0.0, color: AppColor.grey.withOpacity(0.5),),),
      TextSpan(text: notify.title == null ? ' ' : '${notify.title}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0.0, color: Colors.redAccent.withOpacity(0.5),),),
      TextSpan(text: ' is about to be screen.', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0.0, color: AppColor.grey.withOpacity(0.5),),),
    ],
  ),
),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -16,
                left: 0,
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: Image.asset("assets/images/runner.png",),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
