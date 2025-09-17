import 'package:flutter/material.dart';

class GridClass extends StatelessWidget {
  const GridClass({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blueAccent,
          width: double.infinity,
          height: 450,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}
