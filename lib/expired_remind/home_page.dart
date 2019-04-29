import "package:flutter/material.dart";
import 'dart:async';

class MyExpiredRemindApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyExpiredRemindState();
  }
}


class _MyExpiredRemindState extends State<MyExpiredRemindApp> {

 var _dateValue = "";

 List<String> widgetList = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyExpiredReminder"),
      ),
      body: ListView.builder(
        itemCount: widgetList.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(widgetList.elementAt(index));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
        _selectDate();
            print(_dateValue);
      }),
    );
  }


  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2020)
    );
    if (picked != null) setState(() {
      _dateValue = picked.toString();
      print(_dateValue);
      _showAlertDialog(context, _dateValue);
    });
  }

  Future _showAlertDialog(BuildContext context, String date) async {
    var _value = "";
    return showDialog(
        context: context,
    child: new AlertDialog(
      title: Text("title"),
      content: TextField(
        decoration: InputDecoration(
          hintText: "input reminder",
          hintStyle: TextStyle(
            color: Colors.grey
          ),
        ),
        style: TextStyle(
          fontSize: 12.0,
        ),
        onChanged: (text) {
          _value = text.toString();
        }
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
          print(_value);
          setState(() {
            widgetList.add(_value + _dateValue);
          });
          Navigator.pop(context);
        },
        child: Text("OK"),
        ),
      ],
    ));
  }

}
