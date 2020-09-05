import 'package:cathy_laundry_app/widgets/order_btn.dart';
import 'package:cathy_laundry_app/widgets/task_widget.dart';
import 'package:cathy_laundry_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'filter_chip.dart';

class WashingPage extends StatefulWidget {
  @override
  _WashingPageState createState() => _WashingPageState();
}

class _WashingPageState extends State<WashingPage> {
  static int _shirtCounter = 0;
  static int _sweaterCounter = 0;
  static int _jeanCounter = 0;
  static int _trouserCounter = 0;
  static int _jacketCounter = 0;
  static int _shortCounter = 0;
  static int _sneakerCounter = 0;

  //below wil get rates from API get method
  static double _shirtRate = 2.00;
  static double _sweaterRate = 4.00;
  static double _jeanRate = 5.00;
  static double _trouserRate = 5.50;
  static double _jacketRate = 11.00;
  static double _shortRate = 4.25;
  static double _sneakerRate = 20.00;

  @override
  Widget build(BuildContext context) {
    final int _washIronLaundryOrder = _sweaterCounter +
        _jeanCounter +
        _shirtCounter +
        _trouserCounter +
        _shortCounter +
        _jacketCounter +
        _sneakerCounter;
    final double _washIronTotalCost = (_sweaterCounter * _sweaterRate) +
        (_jeanCounter * _jeanRate) +
        (_shirtRate * _shirtCounter) +
        (_trouserRate * _trouserCounter) +
        (_shortRate * _shortCounter) +
        (_jacketRate * _jacketCounter) +
        (_sneakerRate * _sneakerCounter);

    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: new Text(
              "Wash & Iron ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
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
          actions: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.shopping_basket),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$_washIronLaundryOrder Items"),
              )
            ])
          ],
        ),
        floatingActionButton: OrderRoundedButton(_washIronTotalCost, () {
          print('FUNCTION WORKED');
        }),
        body: Container(
          child: ListView(children: <Widget>[
            TotalCost(
                _washIronTotalCost, 'Let us help with your Washing & Ironing'),
            OrderTask(
              (int value) {
                setState(() => _shirtCounter += value);
              },
              'Shirt',
              '$_shirtRate',
              _shirtCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _sweaterCounter += value);
              },
              'Sweater',
              '$_sweaterRate',
              _sweaterCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _jeanCounter += value);
              },
              'Jeans',
              '$_jeanRate',
              _jeanCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _jacketCounter += value);
              },
              'Jacket',
              '$_jacketRate',
              _jacketCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _shortCounter += value);
              },
              'Shorts',
              '$_shortRate',
              _shortCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _shortCounter += value);
              },
              'Sneakers',
              '$_sneakerRate',
              _sneakerCounter,
            ),
            SizedBox(height: 8.0),
            _buildLaundrySneakerAdd(),
            SizedBox(height: 100.0),
          ]),
        ));
  }

  Widget _buildLaundrySneakerAdd() {
    return new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 60.0,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: <Widget>[
        Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
              //boxShadow: BoxShadow(),
              borderRadius: BorderRadius.circular(50),
              color: Colors.deepPurpleAccent.withOpacity(0.45),
            ),
            child: const Icon(
              Icons.polymer,
              color: Colors.white,
            )),
        Column(children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20, top: 8.0),
              child: Text("Add new ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent.withOpacity(0.6)))),
          Container(
              padding: EdgeInsets.only(top: 4.0),
              child: Text("R $_sneakerRate",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen[500]))),
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            children: <Widget>[
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                      height: 20,
                      width: 20,
                      margin:
                          EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
                      decoration: BoxDecoration(
                        //boxShadow: BoxShadow(),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.lightGreen[300],
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      )),
                ),
                onTap: () {
                  setState(() {
                    _sneakerCounter--;
                  });
                },
              ),
              SizedBox(
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    '$_sneakerCounter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600].withOpacity(0.65),
                        fontSize: 15),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _sneakerCounter++;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                      height: 20,
                      width: 20,
                      margin:
                          EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
                      decoration: BoxDecoration(
                        //boxShadow: BoxShadow(),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.lightGreen[300],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
