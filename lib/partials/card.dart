import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 300,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                'N.',
              ),
              Image(width: 50, height: 50, image: AssetImage('images/mc.png')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Debit card'),
                  Row(
                    children: [
                      Icon(Icons.horizontal_rule),
                      Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        '4098',
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.remove_red_eye_outlined),
                    Text('Details'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
