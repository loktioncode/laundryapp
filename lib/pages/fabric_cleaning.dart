import 'package:cathy_laundry_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FabricCleaning extends StatefulWidget {
  @override
  _FabricCleaningState createState() => _FabricCleaningState();
}

class _FabricCleaningState extends State<FabricCleaning> {
  static int _sheetCounter = 0;
  static int _curtainCounter = 0;
  static int _bedLiningCounter = 0;
  static int _tableClothCounter = 0;

  //below wil get rates from API get method
  static double _sheetRate = 2.00;
  static double _curtainRate = 4.00;
  static double _bedLiningRate = 5.00;
  static double _tableClothRate = 5.50;

  _dialog_Builder(BuildContext context, _fabricCleaningTotalCost) {
    if (_fabricCleaningTotalCost < 0.20) {
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
                  child: Text('Total: R $_fabricCleaningTotalCost',
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
    final int _fabricCleaningOrder = _sheetCounter +
        _curtainCounter +
        _bedLiningCounter +
        _tableClothCounter;
    final double _fabricCleaningTotalCost = (_sheetCounter * _sheetRate) +
        (_curtainCounter * _curtainRate) +
        (_tableClothRate * _tableClothCounter) +
        (_bedLiningRate * _bedLiningCounter);

    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: new Text(
              "Fabric Clean",
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
                child: Text("$_fabricCleaningOrder Items"),
              )
            ])
          ],
        ),
        floatingActionButton: OrderRoundedButton(_fabricCleaningTotalCost, () {
          print('FUNCTION WORKED');
        }),
        body: Container(
          child: ListView(children: <Widget>[
            TotalCost(_fabricCleaningTotalCost,
                'Get all your fabrics cleaned today!'),
            OrderTask(
              (int value) {
                setState(() => _sheetCounter += value);
              },
              'Sheets',
              '$_sheetRate',
              _sheetCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _sheetCounter += value);
              },
              'Curtain',
              '$_curtainRate',
              _curtainCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _tableClothCounter += value);
              },
              'Table Cloth',
              '$_tableClothRate',
              _tableClothCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _bedLiningCounter += value);
              },
              'Bed Linen',
              '$_bedLiningRate',
              _bedLiningCounter,
            ),
            SizedBox(height: 8.0),
            OrderTask(
              (int value) {
                setState(() => _tableClothCounter += value);
              },
              'Add New',
              '$_tableClothRate',
              _tableClothCounter,
            ),
            SizedBox(height: 100.0),
          ]),
        ));
  }
}
