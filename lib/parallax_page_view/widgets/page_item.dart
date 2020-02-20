import 'package:flutter/material.dart';
import 'package:flutter_app/parallax_page_view/model/trip.dart';
import 'package:flutter_app/parallax_page_view/widgets/trip_page_visibility_resolver.dart';

class TripPageItem extends StatelessWidget {
  final Trip trip;
  final TripPageVisibility tripPageVisibility;

  final titleCaintainer = Text('''
  title
  ''');

  final description = Padding(
    padding: EdgeInsets.all(16.0),
    child: Text("content"),
  );

  final imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
    gradient: LinearGradient(
        colors: [Color.fromRGBO(0, 0, 0, 0), Color.fromRGBO(0, 0, 0, 0.8)],
        end: FractionalOffset.bottomCenter,
        begin: FractionalOffset.topCenter),
  ));

  TripPageItem({Key key, this.trip, this.tripPageVisibility}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
