import 'package:flutter/material.dart';
import 'package:flutter_app/go_to_market/api.dart';
import 'package:flutter_app/go_to_market/item.dart';

class MyGoToMarketApp extends StatefulWidget {
  final String title;

  MyGoToMarketApp({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyGoToMarketAppState();
  }
}

class MyGoToMarketAppState extends State<MyGoToMarketApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Map>>(
        builder: (context, snap) {
          if (snap.hasData) {
            final data = snap.data;
            return Scrollbar(
              child: ListView.builder(itemBuilder: (context, index) {
                final Map item = data[index];
                return Card(
                  child: Material(
                    color: Colors.amber,
                    child: InkWell(
                      onTap: () {
                        final route = MaterialPageRoute(
                            builder: (context) => Item(map: item));
                        Navigator.of(context).push(route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("交易日期"),
                            Text(item["作物代號"]),
                            Text(item["作物名稱"]),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child:
                                        Center(child: Text("${item["上價"]}"))),
                                Expanded(
                                    child:
                                        Center(child: Text("${item["中價"]}"))),
                                Expanded(
                                    child:
                                        Center(child: Text("${item["下價"]}"))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          } else if (snap.hasError) {
            final error = snap.error;
            return Center(child: Text("Error"));
          } else {
            return Center(child: Text("Loading"));
          }
        },
        future: fetchData(),
      ),
    );
  }
}
