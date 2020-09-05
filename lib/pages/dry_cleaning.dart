import 'package:flutter/material.dart';
import 'package:cathy_laundry_app/widgets/widgets.dart';

class DryCleanPage extends StatefulWidget {
  @override
  _DryCleanPageState createState() => _DryCleanPageState();
}

class _DryCleanPageState extends State<DryCleanPage> {
  static int _fullSuitCounter = 0;
  static int _suitJacketCounter = 0;
  static int _coatCounter = 0;
  static int _furCoatCounter = 0;
  static int _trouserCounter = 0;
  static int _dressCounter = 0;
  static int _hatCounter = 0;

  //below wil get rates from API get method
  static double _fullSuitRate = 2.00;
  static double _suitJacketRate = 4.00;
  static double _coatRate = 5.00;
  static double _trouserRate = 5.50;
  static double _furCoatRate = 11.00;
  static double _shortRate = 4.25;
  static double _dressRate = 20.00;
  static double _hatRate = 20.00;

  @override
  Widget build(BuildContext context) {
    final int _dryCleanOrder = _fullSuitCounter +
        _suitJacketCounter +
        _coatCounter +
        _furCoatCounter +
        _trouserCounter +
        _dressCounter +
        _hatCounter;
    final double _dryCleanTotalCost = (_fullSuitCounter * _fullSuitRate) +
        (_suitJacketCounter * _suitJacketRate) +
        (_furCoatRate * _furCoatCounter) +
        (_coatRate * _coatCounter) +
        (_trouserRate * _trouserCounter) +
        (_hatRate * _hatCounter) +
        (_dressRate * _dressCounter);

    _dialog_Builder(BuildContext context, _dryCleanTotalCost) {
      if (_dryCleanTotalCost < 0.20) {
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
                    child: Text('Total: R $_dryCleanTotalCost',
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

    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: new Text(
              "Dry Clean",
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
                child: Text("$_dryCleanOrder Items"),
              )
            ])
          ],
        ),
        floatingActionButton: OrderRoundedButton(_dryCleanTotalCost, () {
          print('FUNCTION WORKED');
        }),
        body: Container(
          child: ListView(children: <Widget>[
            TotalCost(
                _dryCleanTotalCost, 'What would you like to get dry cleaned?'),
            OrderTask(
              (int value) {
                setState(() => _fullSuitCounter += value);
              },
              'Full Suit',
              '$_fullSuitRate',
              _fullSuitCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _suitJacketCounter += value);
              },
              'Suit Jacket',
              '$_suitJacketRate',
              _suitJacketCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _trouserCounter += value);
              },
              'Trouser',
              '$_trouserRate',
              _trouserCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _furCoatCounter += value);
              },
              'Fur Coat',
              '$_furCoatRate',
              _furCoatCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _coatCounter += value);
              },
              'Coat',
              '$_coatRate',
              _coatCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _hatCounter += value);
              },
              'Hat',
              '$_hatRate',
              _hatCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _dressCounter += value);
              },
              'Dress',
              '$_dressRate',
              _dressCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _coatCounter += value);
              },
              'Add +',
              '$_coatRate',
              _coatCounter,
            ),
            SizedBox(height: 100.0),
          ]),
        ));
  }
}
