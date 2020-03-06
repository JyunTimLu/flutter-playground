import 'package:flutter/material.dart';
import 'package:flutter_app/0to1/routes/page3.dart';

class Page2 extends StatelessWidget {
  final String param;

  const Page2({Key key, this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Route App')),
      body: Center(
        child: Column(
          children: <Widget>[
            Center(
                child: Container(
              color: Colors.amber,
              width: 200.0,
              height: 200.0,
              child: Center(child: Page3Navigator()),
            )),
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
            ),
            _genParamsText(param ?? arg),
          ],
        ),
      ),
    );
  }

  Widget _genParamsText(param) {
    if (param == null) {
      return Container();
    } else {
      return Text(param);
    }
  }
}
