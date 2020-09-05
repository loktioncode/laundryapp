import 'package:flutter/material.dart';

//filter chip 
class FilterChipWidget extends StatefulWidget{
  final String chipName;
  final int chipAction;

  FilterChipWidget({Key key, this.chipName, this.chipAction}) : super(key: key);
  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();

}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context){
    return new FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
      backgroundColor:Colors.deepPurpleAccent.withOpacity(0.45), //Theme.of(context).primaryColor.withOpacity(0.7)
      selected: _isSelected,
      onSelected: (isSelected) async{
        setState(() {
         _isSelected = isSelected; 
        });
      },
      selectedColor: Colors.deepPurpleAccent.withOpacity(0.75),
    );
  }
}
