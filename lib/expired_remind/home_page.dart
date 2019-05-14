import "package:flutter/material.dart";
import 'package:flutter_app/main.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'dart:async';
import "package:provider/provider.dart";

class MyExpiredRemindApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyExpiredRemindState();
  }
}

class _MyExpiredRemindState extends State<MyExpiredRemindApp> {
  var _dateValue = "";

  List<String> dateList = List<String>();
  List<String> remindList = List<String>();

  @override
  void initState() {
    print("iniState");
    super.initState();

    _getDateList().then((List<String> list) {
      _getRemindList().then((List<String> list2) {
        print(list.length);
        print(list2.length);
        setState(() {
          dateList.addAll(list);
          remindList.addAll(list2);
          controller.add(dateList.isEmpty);
        });
      });
    });
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEmpty = Provider.of<bool>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("MyExpiredReminder"),
      ),
      body: !isEmpty ? _buildListView() : _buildEmptyView(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _selectDate();
            print(_dateValue);
          }),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: dateList.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(UniqueKey().toString()),
          onDismissed: (DismissDirection direction) {
            setState(() {
              dateList.removeAt(index);
              remindList.removeAt(index);
              controller.add(dateList.isEmpty);
              _setData(dateList, remindList);
            });
          },
          child: Card(
            margin: EdgeInsets.all(16.0),
            color: Colors.amberAccent,
            child: InkWell(
              onTap: () {
                print(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Text(
                        remindList.elementAt(index),
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        dateList.elementAt(index),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.amberAccent,
              size: 180.0,
            ),
            Text("No More Data"),
          ]),
    );
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2020));
    if (picked != null)
      setState(() {
        _dateValue = "${picked.year}/${picked.month}/${picked.day}";
        print(_dateValue);
        _showAlertDialog(context, _dateValue);
      });
  }

  Future _showAlertDialog(BuildContext context, String date) async {
    var _value = "";
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text("title"),
        content: TextField(
            decoration: InputDecoration(
              hintText: "input reminder",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(
              fontSize: 12.0,
            ),
            onChanged: (text) {
              _value = text.toString();
            }),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print(_value);
              setState(() {
                dateList.add(_dateValue);
                remindList.add(_value);
                controller.add(dateList.isEmpty);
                _setData(dateList, remindList);
              });
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  Future<List<String>> _getDateList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList("DATE_LIST");
  }

  Future<List<String>> _getRemindList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList("REMIDE_LIST");
  }

  _setData(List<String> dateList, List<String> remindList) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList("DATE_LIST", dateList);
    pref.setStringList("REMIDE_LIST", remindList);
  }

  _showBottomSheet() async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.accessible,
                    color: Colors.amberAccent,
                  ),
                  title: Text("accessible"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.accessible,
                    color: Colors.amberAccent,
                  ),
                  title: Text("accessible"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.accessible,
                    color: Colors.amberAccent,
                  ),
                  title: Text("accessible"),
                ),
              ],
            ),
          );
        });
  }
}
