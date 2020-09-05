import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MyOrder extends StatelessWidget {
  MyOrder(this.orderNumber, this.orderStatus);

  final String orderNumber;
  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: <Widget>[
        Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(
              left: 12.0,
            ),
            decoration: BoxDecoration(
              //boxShadow: BoxShadow(),
              borderRadius: BorderRadius.circular(50),
              color: Colors.deepPurpleAccent.withOpacity(0.45),
            ),
            child: const Icon(
              Icons.import_contacts,
              color: Colors.white,
              size: 20.0,
            )),
        Column(children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20, top: 8.0),
              child: Text(
                "Order No: $orderNumber ",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.deepPurpleAccent.withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 20, top: 4.0),
              child: Text(
                '$orderStatus',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.lightGreen[500],
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ])
      ]),
    );
  }
}
