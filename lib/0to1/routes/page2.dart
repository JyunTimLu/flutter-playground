import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route App')),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('this is page2'),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                RaisedButton(
                    child: Text('like'),
                    onPressed: () {
                      Navigator.pop(context, 'like');
                    }),
                Spacer(
                  flex: 1,
                ),
                RaisedButton(
                    child: Text('dislike'),
                    onPressed: () {
                      Navigator.pop(context, 'dislike');
                    }),
                Spacer(
                  flex: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
