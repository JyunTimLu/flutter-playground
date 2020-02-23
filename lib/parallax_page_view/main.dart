import 'package:flutter/material.dart';
import 'package:flutter_app/parallax_page_view/model/trip.dart';
import 'package:flutter_app/parallax_page_view/widgets/page_item.dart';
import 'package:flutter_app/parallax_page_view/widgets/page_transformer.dart';
import 'package:flutter_app/parallax_page_view/widgets/trip_page_visibility_resolver.dart';

class MyParallaxPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trip = [
      Trip("title", "description", 'assets/starlux_2.jpg'),
      Trip("title", "description", 'assets/starlux_3.jpg'),
      Trip("title", "description", 'assets/starlux_4.jpg'),
      Trip("title", "description", 'assets/starlux_5.jpg'),
      Trip("title", "description", 'assets/starlux_6.jpg'),
      Trip("title", "description", 'assets/starlux_7.jpg')
    ];

    return Container(
      color: Colors.amber,
      child: SafeArea(
        child: Scaffold(
            body: Container(
          color: Colors.amber,
          child: PageTransformer(
            builder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: trip.length,
                itemBuilder: (context, index) {
                  final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);
                  return TripPageItem(
                    trip: trip[index],
                    tripPageVisibility: pageVisibility,
                  );
                });
            },   
          ),
        )),
      ),
    );
  }
}
