import 'package:flutter/material.dart';

class GridViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid View"),
        ),
        body: _genGridViewByBuilder());
  }

  Widget _genGridViewByCount() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      children: List.generate(100, (index) {
        return Card(
            color: Colors.green, child: Container(child: Text("$index")));
      }),
    );
  }

  Widget _genGridViewByBuilder() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100, childAspectRatio: 2 / 3),
        itemBuilder: (context, index) {
          return Card(
              color: Colors.green, child: Container(child: Text("$index")));
        });
  }
}
