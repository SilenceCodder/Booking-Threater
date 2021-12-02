import 'package:booking_theater/Ui/FilmInfoScreen.dart';
import 'package:booking_theater/model/MoviesModel.dart';
import 'package:booking_theater/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularCourseListView extends StatefulWidget {
  final Function callBack;

  const PopularCourseListView({Key key, this.callBack}) : super(key: key);
  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularCourseListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var movie = Provider.of<MoviesModel>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          } else {
            return GridView(
              padding: EdgeInsets.all(8),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(
                movie.movies.length,
                (index) {
                  var count = movie.movies.length;
                  var animation = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController.forward();
                  return CategoryView(
                    movies: movie.movies[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        },
      ),
    );
  }

}

class CategoryView extends StatelessWidget {
  final VoidCallback callback;
  final Movies movies;
  final AnimationController animationController;
  final Animation animation;

  const CategoryView(
      {Key key,
      this.movies,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                moveTo(context: context,
                  title: movies.title,
                  description: movies.description,
                  director: movies.director,
                  duration: movies.durationMin,
                  imagePath: movies.movieImg,
                  isBooked: movies.bookStatus,
                  remain: movies.availableSeats.toString(),
                  seats: movies.no0fSeats.toString(),
                  cast: movies.cast,
                  listSeats: movies.seatNumbers,
                  movieId: movies.movieId,

                );
              },
              child: SizedBox(
                height: 280,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: new BoxDecoration(
                                color:  Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                // border: new Border.all(
                                //     color: DesignCourseAppTheme.notWhite),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, left: 16, right: 16),
                                            child: Text(
                                              movies.title,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 0.27,
                                                color: AppColor
                                                    .darkerText,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 16,
                                                right: 16,
                                                bottom: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  (movies.no0fSeats == 0 ? '0 Seat' : '${movies.no0fSeats.toString()} Seats'),
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    letterSpacing: 0.27,
                                                    color: AppColor
                                                        .grey,
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      (movies.bookStatus ? Icon(
                                                        Icons.star,
                                                        color:
                                                        AppColor.d,
                                                        size: 20,
                                                      ) : Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.grey,
                                                        size: 20,
                                                      ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: AppColor.grey
                                      .withOpacity(0.2),
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            child: AspectRatio(
                                aspectRatio: 1.28,
                                child: (movies.movieImg == null ? Image.asset('assets/images/m4.jpg', fit: BoxFit.cover,)
                                      : FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/loading.gif',
                                  image: movies.movieImg,
                                  height: 80.0, width: 70.0,
                                ))
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  void moveTo({BuildContext context, bool isBooked, String imagePath, title, duration, seats,
    remain, description, director, cast, List<int> listSeats, movieId}) {
   print('************** BEFORE SENDING*********');
   print(isBooked);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilmInfoScreen(
          description: description,
          director: director,
          imagePath: imagePath,
          title: title,
          isBooked: isBooked,
          remain: remain,
          seats: seats,
          duration: duration,
          cast: cast,
         listSeats: listSeats,
          movieId: movieId,
        ),
      ),
    );
  }
}

