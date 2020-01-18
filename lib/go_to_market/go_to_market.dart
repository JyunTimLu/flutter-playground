import 'package:flutter/material.dart';
import 'package:flutter_app/go_to_market/api/repository.dart';
import 'package:flutter_app/go_to_market/blocs/market_bloc.dart';
import 'package:flutter_app/go_to_market/blocs/market_event.dart';
import 'package:flutter_app/go_to_market/blocs/market_state.dart';
import 'package:flutter_app/go_to_market/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyGoToMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketBloc(MarketRepo()),
      child: GoToMarketApp(
        title: "12345",
      ),
    );
  }
}

class GoToMarketApp extends StatefulWidget {
  final String title;

  const GoToMarketApp({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoToMarketAppState();
  }
}

class GoToMarketAppState extends State<GoToMarketApp> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MarketBloc>(context).add(FetchMarketEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<MarketBloc, MarketState>(
        listener: (context, state) {},
        child: BlocBuilder<MarketBloc, MarketState>(
          builder: (context, state) {
            if (state is MarketLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is MarketLoaded) {
              final data = state.mapList;
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
            }
            return Center(child: Text("Error"));
          },
        ),
      ),
    );
  }
}
