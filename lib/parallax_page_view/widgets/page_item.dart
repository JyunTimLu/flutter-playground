import 'package:flutter/material.dart';
import 'package:flutter_app/parallax_page_view/model/trip.dart';
import 'package:flutter_app/parallax_page_view/widgets/trip_page_visibility_resolver.dart';

class TripPageItem extends StatelessWidget {
  final Trip trip;
  final TripPageVisibility tripPageVisibility;

  TripPageItem({@required this.trip, @required this.tripPageVisibility});
  // TripPageItem({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildImageContainer(),
              _buildTextContainer(),
              _buildImageOverlayContainer()
            ],
          ),
        ));
  }

  Widget _buildImageContainer() {
    return Image.asset(
      trip.imageUrl,
      fit: BoxFit.cover,
      alignment: Alignment(this.tripPageVisibility.pagePosition, 0),
    );
  }

  Widget _buildImageOverlayContainer() {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color.fromRGBO(0, 0, 0, 0),
            Color.fromRGBO(0, 0, 0, 0.8),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContainer() {
    var titleContainer = Text(
      this.trip.title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        fontSize: 14,
      ),
    );

    var descriptionContainer = Padding(
      padding: EdgeInsets.only(top: 8),
      child: Text(
        this.trip.description,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Positioned(
      bottom: 60,
      left: 32,
      right: 32,
      child: Column(
        children: <Widget>[
          titleContainer,
          descriptionContainer,
        ],
      ),
    );
  }
}
