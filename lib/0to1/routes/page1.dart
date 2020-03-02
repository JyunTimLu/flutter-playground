import 'package:flutter/material.dart';
import 'package:flutter_app/0to1/routes/page2.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({Key key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  String result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('this is page 1'),
          Container(
            child: RaisedButton(
                child: Text('go page 2 '),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Page2();
                    },
                  ));
                  print('');
                }),
          ),
          Container(
            child: RaisedButton(
                child: Text('go page 2 for result'),
                onPressed: () async {
                  final result =
                      await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Page2();
                    },
                  ));
                  if (result != null) {
                    setState(() {
                      this.result = result;
                      print('$result');
                    });
                  }
                }),
          ),
          Container(
            child: RaisedButton(
                child: Text('go page 2 by route'),
                onPressed: () async {
                  final result = await Navigator.pushNamed(context, 'page2');
                  if (result != null) {
                    setState(() {
                      this.result = result;
                      print('$result');
                    });
                  }
                  print('');
                }),
          ),
          _buildResultText(result),
          RaisedButton(
            child: Text('go page2 with params'),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Page2(param: 'string param',);
            }));
          })
        ],
      ),
    );
  }

  Widget _buildResultText(result) {
    if (result == null) {
      return Text('Empty result');
    } else {
      return Text(result);
    }
  }
}
