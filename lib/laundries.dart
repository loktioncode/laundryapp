import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class Laundries extends StatefulWidget {
  @override
  _LaundriesState createState() => _LaundriesState();
}

class _LaundriesState extends State<Laundries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("SELECT SERVICE PROVIDER"),
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.35),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          // return Card(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text(
          //       position.toString(),
          //       style: GoogleFonts.lato(
          //         textStyle: TextStyle(
          //             decoration: TextDecoration.none,
          //             color: Colors.white,
          //             fontSize: 32,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ),
          // );
          return LaundryCard();
        },
      ),
    );
  }
}
