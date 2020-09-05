import 'package:cathy_laundry_app/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:cathy_laundry_app/widgets/widgets.dart';

class CleaningPage extends StatefulWidget {
  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  static int _roomCounter = 0;
  static int _wallCounter = 0;
  static int _windowCounter = 0;
  static int _carpetCounter = 0;

  final double _roomRate = 5.00;
  final double _windowRate = 15.00;
  final double _carpetRate = 5.50;
  final double _wallRate = 13.00;

  _dialog_Builder(BuildContext context, _houseCleanTotal) {
    if (_houseCleanTotal < 0.20) {
      return SimpleDialog(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                height: 50.0,
                width: 50.0,
                child: Text('Order Cost Must be above 0.00ZAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.withOpacity(0.55),
                        fontSize: 14))),
          )
        ],
      );
    } else {
      return SimpleDialog(
        children: <Widget>[
          Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('Total: R $_houseCleanTotal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen.withOpacity(0.65),
                          fontSize: 20))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Order: HC0087',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w200),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50)),
                height: 45,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Proceed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ])
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final int _houseCleanOrder =
        _roomCounter + _wallCounter + _windowCounter + _carpetCounter;
    final double _houseCleanTotal = (_roomCounter * _roomRate) +
        (_wallCounter * _wallRate) +
        (_windowCounter * _windowRate) +
        (_carpetCounter * _carpetRate);

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurpleAccent[200].withOpacity(.5),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: new Text(
            "Cleaning",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        actions: <Widget>[
          Row(children: <Widget>[
            Icon(Icons.shopping_basket),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$_houseCleanOrder Items"),
            )
          ])
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: "back",
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: (context) => _dialog_Builder(context, _houseCleanTotal)),
        child: Container(
          width: MediaQuery.of(context).size.width - 35,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.lightGreen[100],
                  Colors.deepPurpleAccent.withOpacity(0.35)
                ]),
            //border: Border.all(color: Colors.lightGreen[500].withOpacity(0.5), width: 1.0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(
            "Order",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          )),
        ),
      ),
      body: Stack(children: <Widget>[
        Image.asset(
          "assets/foam.png",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        ClipPath(
          child: Container(
            color: Colors.deepPurpleAccent.withOpacity(0.35),
          ),
          clipper: getClipper(),
        ),
        Container(
          margin: EdgeInsets.all(20),
          height: 100.0,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          child: new Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                child: Text('R $_houseCleanTotal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30))),
          ]),
        ),
        Positioned(
          top: 90,
          child: Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Text("Full House cleaning",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 16)),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 140),
            child: _buildRooms()),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 205),
            child: _buildWindow()),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 270),
            child: _buildCarpet()),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 335),
            child: _buildWall()),
      ]),
    );
  }

  Widget _buildRooms() {
    return OrderTask((int value) {
      setState(() => _roomCounter += value);
    }, 'Rooms', '$_roomRate', _roomCounter);
  }

  Widget _buildWall() {
    return OrderTask((int value) {
      setState(() => _wallCounter += value);
    }, 'Walls', _wallRate, _wallCounter);
  }

  Widget _buildWindow() {
    return OrderTask((int value) {
      setState(() => _windowCounter += value);
    }, 'Windows', _windowRate, _windowCounter);
  }

  Widget _buildCarpet() {
    return OrderTask((int value) {
      setState(() => _carpetCounter += value);
    }, 'Carpet', _carpetRate, _carpetCounter);
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.conicTo(400, 700, size.width + 500, -5.0, 1);
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
