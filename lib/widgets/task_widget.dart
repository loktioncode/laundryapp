import 'package:flutter/material.dart';

class OrderTask extends StatefulWidget {
  OrderTask(this.onCountChanged, this.title, this.price, this.counter);

  final Function(int) onCountChanged;
  dynamic title;
  dynamic price;
  dynamic counter;

  @override
  _OrderTaskState createState() => _OrderTaskState();
}

class _OrderTaskState extends State<OrderTask> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 60.0,
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
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
        ),
        Expanded(
          flex: 2,
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 20, top: 8.0),
                child: Text("${widget.title}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent.withOpacity(0.6)))),
            Container(
                padding: EdgeInsets.only(top: 4.0),
                child: Text("R ${widget.price}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen[500]))),
          ]),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              InkWell(
                  splashColor: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        height: 25,
                        width: 25,
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
                  onTap: () => widget.onCountChanged(-1)),
              Expanded(
                flex: 1,
                child: Text(
                  '${widget.counter}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600].withOpacity(0.65),
                      fontSize: 15),
                ),
              ),
              InkWell(
                splashColor: Colors.deepPurpleAccent,
                onTap: () {
                  widget.onCountChanged(1);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                      height: 25,
                      width: 25,
                      margin: EdgeInsets.only(left: 0.0, top: 8.0, bottom: 8.0),
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
