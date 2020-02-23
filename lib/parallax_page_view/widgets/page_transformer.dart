import 'package:flutter/material.dart';
import 'package:flutter_app/parallax_page_view/widgets/trip_page_visibility_resolver.dart';

typedef PageView TripPageViewBuilder(
    BuildContext context, TripPageVisibilityResolver visibilityResolver);

class PageTransformer extends StatefulWidget {
  final TripPageViewBuilder builder;

  PageTransformer({Key key, this.builder}) : super(key: key);

  @override
  _PageTransformerState createState() => _PageTransformerState();
}

class _PageTransformerState extends State<PageTransformer> {
  TripPageVisibilityResolver _visibilityResolver;

  @override
  Widget build(BuildContext context) {
    final pageView = this
        .widget
        .builder(context, _visibilityResolver ?? TripPageVisibilityResolver());

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        setState(() {
          _visibilityResolver = TripPageVisibilityResolver(
            scrollMetrics: notification.metrics,
            viewPortFraction: pageView.controller.viewportFraction,
          );
        });

        return null;
      },
      child: pageView,
    );
  }
}
