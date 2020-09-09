import 'package:cathy_laundry_app/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import './create_account.dart';
import './login.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        primaryColorLight: Colors.lightGreen[200]),
    debugShowCheckedModeBanner: false,
    home: HomePage()));
    

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: Login())); //LandingPage()
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/hanged.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightGreen[200].withOpacity(0.5),
                Colors.deepPurpleAccent.withOpacity(0.8)
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Online Laundry & Cleaning services!",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Let Mncedisi manage your choes",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(seconds: 1),
                          type: PageTransitionType.downToUp,
                          child: LandingPage()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "Get Started",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.deepPurpleAccent[200],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 800),
                          type: PageTransitionType.upToDown,
                          child: CreateAccount()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
