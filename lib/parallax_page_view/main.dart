import 'package:flutter/material.dart';
import 'package:flutter_app/parallax_page_view/model/trip.dart';
import 'package:flutter_app/parallax_page_view/widgets/page_item.dart';
import 'package:flutter_app/parallax_page_view/widgets/trip_page_visibility_resolver.dart';

class MyParallaxPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: TripPageItem(
          trip: Trip("title", "description", "imageUrl"),
          tripPageVisibility: TripPageVisibility(0.0),
        ),
      )),
    );
  }
}
