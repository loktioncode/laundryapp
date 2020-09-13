import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../laundries.dart';

class OrderRoundedButton extends StatelessWidget {
  OrderRoundedButton(this.orderTotal, this.proceedOrder);

  dynamic orderTotal;
  dynamic proceedOrder;

  void _modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 550.0,
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.only(right: 4.0),
                                  child: Text(
                                    'Checkout',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.deepPurple[400],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Colors.deepPurpleAccent,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 90,
                                height: 45,
                                color: Colors.red,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      '300',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 90,
                                height: 45,
                                color: Colors.red,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      '100',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 90,
                                height: 45,
                                color: Colors.red,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      '1,322',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          );
        });
  }

  dynamic _dialog_Builder(BuildContext context, dynamic orderTotal) {
    if (orderTotal <= 0.20) {
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
                  child: Text('Total: R $orderTotal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen.withOpacity(0.65),
                          fontSize: 20))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Order: WI0087',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w200),
              ),
            ),
            Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: <Widget>[
                // FilterChipWidget(chipName: 'Collection'),
                // FilterChipWidget(chipName: 'InHouse'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                splashColor: Colors.deepPurple,
                onTap: () {
                  // _modalBottomSheetMenu(context);
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(seconds: 1),
                          type: PageTransitionType.downToUp,
                          child: Laundries()));
                },
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
              ),
            )
          ])
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialog_Builder(context, orderTotal)),
      child: Container(
        width: MediaQuery.of(context).size.width - 35,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Colors.lightGreen[100],
                Colors.deepPurpleAccent.withOpacity(0.85)
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
    );
  }
}
