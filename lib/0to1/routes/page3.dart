import 'package:flutter/material.dart';

class Page3Navigator extends StatelessWidget {
  const Page3Navigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'page3',
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'page3':
            builder = (BuildContext context) => Page3();
            break;
          case 'page4':
            builder = (BuildContext context) => Page4();
            break;
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
      child: Text("123"),
      onPressed: () {
        Navigator.of(context).pushNamed('page4');
      },
    ));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("i am page 4"),
        onPressed: () {},
      ),
    );
  }
}
