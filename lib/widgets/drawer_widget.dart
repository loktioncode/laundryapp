import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Container(
              
              width: 310,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.45)
              ),
              child: Column(
                children:[
                  Container(
                    margin:EdgeInsets.only(top:60.0),
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(55),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: Text("Elishabere4@gmail.com", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white))
                      ),
                  ),
                ]
              ),
              ),
              Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.import_contacts, size: 30, color: Colors.grey[500]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:20.0),
                        child: Text("Orders", style: TextStyle(fontWeight: FontWeight.w600, color:Colors.lightGreen, fontSize: 15)))
                    ]
                  ),
                ),
              ),
            Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.share, size: 30,color: Colors.grey[500]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:20.0),
                        child: Text("Share", style: TextStyle(fontWeight: FontWeight.w600, color:Colors.lightGreen, fontSize: 15)))
                    ]
                  ),
                ),
              ),
            Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.settings, size: 30,color: Colors.grey[500]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:20.0),
                        child: Text("Settings", style: TextStyle(fontWeight: FontWeight.w600, color:Colors.lightGreen, fontSize: 15)))
                    ]
                  ),
                ),
              ),
            Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.exit_to_app , size: 30, color: Colors.grey[500],),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:20.0),
                        child: Text("Exit", style: TextStyle(fontWeight: FontWeight.w600, color:Colors.lightGreen, fontSize: 15)))
                    ]
                  ),
                ),
              ),
          ]
        );
  }
}