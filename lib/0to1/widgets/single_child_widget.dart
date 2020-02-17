import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      alignment: Alignment(0.0, 0.0),
      constraints: BoxConstraints.expand(),
    );
  }

  /**
   * Alignment
   * -------------------------------
   * |(-1, -1)              (1, -1)|
   * |                             |
   * |            (0, 0)           |
   * |                             |
   * |(-1, 1)                (1, 1)|
   * -------------------------------
   * 
   * Alignment topLeft = Alignment(-1.0, -1.0);
   * Alignment topCenter = Alignment(0.0, -1.0);
   * Alignment topRight = Alignment(1.0, -1.0);
   * Alignment centerLeft = Alignment(-1.0, 0.0);
   * Alignment center = Alignment(0.0, 0.0);
   * Alignment centerRight = Alignment(1.0, 0.0);
   * Alignment bottomLeft = Alignment(-1.0, 1.0);
   * Alignment bottomCenter = Alignment(0.0, 1.0);
   * Alignment bottomRight = Alignment(1.0, 1.0);
   */

  /**
   * BoxConstraint
   * minWidth
   * minHeight
   * maxWidth
   * maxHeight
   */
}
