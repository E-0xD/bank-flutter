import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=> Navigator.pop(context),
          child: Icon(Icons.home),
        ),
      ),
      body: SafeArea(child: Icon(Icons.settings)),
    );
  }
}