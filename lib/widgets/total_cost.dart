import 'package:cathy_laundry_app/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TotalCost extends StatelessWidget {
  TotalCost(this.totalCost, this.title);

  dynamic totalCost;
  dynamic title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      child: new Column(children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            child: Text("R $totalCost",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen.withOpacity(0.55),
                    fontSize: 30))),
        SizedBox(height: 20),
        Text("$title",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withRed(80).withBlue(140).withOpacity(0.35),
                fontSize: 13)),
      ]),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightGreen[200].withOpacity(0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
