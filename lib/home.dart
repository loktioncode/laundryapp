import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'pages/screens.dart';
import 'widgets/widgets.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static final _containerHeight = 100.0;

  // You don't need to change any of these variables
  var _fromTop = -_containerHeight;
  var _controller = ScrollController();
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  void _listener() {
    double offset = _controller.offset;
    var direction = _controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset + difference;
      if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
    }
    setState(
        () {}); // for simplicity I'm calling setState here, you can put bool values to only call setState when there is a genuine change in _fromTop
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title:
              Padding(padding: EdgeInsets.only(left: 65), child: new Text(" ")),
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.35),
          elevation: 0,
        ),
        drawer: Drawer(elevation: 0.2, child: MyDrawer()),
        body: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                color: Colors.deepPurpleAccent.withOpacity(0.35),
              ),
              clipper: getClipper(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Mncedisi Welcomes You!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: ListView(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height / 2.0,
                      child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 15),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 6 / 6,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        duration: Duration(milliseconds: 800),
                                        type: PageTransitionType.downToUp,
                                        child: WashingPage()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: new Column(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 20.0),
                                    child: const Icon(
                                      Icons.local_laundry_service,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Wash & Iron ",
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ]),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.lightGreen[100],
                                        Colors.deepPurpleAccent.withOpacity(0.1)
                                      ]),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        duration: Duration(milliseconds: 800),
                                        type: PageTransitionType.downToUp,
                                        child: DryCleanPage()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: new Column(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 20.0),
                                    child: const Icon(
                                      Icons.shopping_basket,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Dry Cleaning",
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ]),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.lightGreen[100],
                                        Colors.deepPurpleAccent
                                            .withOpacity(0.15)
                                      ]),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        duration: Duration(milliseconds: 800),
                                        type: PageTransitionType.downToUp,
                                        child: CleaningPage()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: new Column(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 20.0),
                                    child: const Icon(
                                      Icons.format_color_fill,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Home Cleaning",
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ]),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.lightGreen[100],
                                        Colors.deepPurpleAccent.withOpacity(0.1)
                                      ]),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 800),
                                          type: PageTransitionType.downToUp,
                                          child: FabricCleaning()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: new Column(children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 20.0),
                                      child: const Icon(
                                        Icons.android,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: Text(
                                          "Fabric Laundry",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ))
                                  ]),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Colors.lightGreen[100],
                                          Colors.deepPurpleAccent
                                              .withOpacity(0.15)
                                        ]),
                                  ),
                                ))
                          ])),
                  SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                          top: 8.0,
                        ),
                        child: Text(
                          "Active Orders",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.deepPurple[200],
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  Column(children: <Widget>[
                    MyOrder('#XXXXXX', 'Order Pending'),
                    MyOrder('#XXXXXX', 'Order Pending'),
                    MyOrder('#XXXXXX', 'Order Pending'),
                    MyOrder('#XXXXXX', 'Order Pending')
                  ])
                ],
              ),
            )
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.conicTo(40, 180, size.width + 100, -10, 1);
    //path.lineTo(0.0, size.height / 2);
    //path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
