import 'package:flutter/material.dart';
import 'package:flutter_app/0to1/routes/page2.dart';

class HomePage1 extends StatelessWidget {
  
  HomePage1({Key key}) : super(key: key);

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
                child: Text('go page 2 by route'),
                onPressed: () async {
                  final result =
                      await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Page2();
                    },
                  ));
                  if (result != null) {
                    this.result = result;
                    print('$result');
                  }
                }),
          ),
          Container(
            child: RaisedButton(
                child: Text('go page 2 for result'),
                onPressed: () {
                  print('');
                }),
          ),
          _buildResultText(result),
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
