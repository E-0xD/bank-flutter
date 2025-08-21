import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  final String time;
  final String address;
  final String amount;

  const TransactionHistory({
    super.key,
    required this.time,
    required this.address,
    required this.amount,
  });

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 70,
      width: 330,
      // color: Colors.amberAccent,
      child: Row(
        children: [
          Image.asset('images/mc.png', height: 100, width: 35),
          Container(
            width: 290,
            padding: EdgeInsets.only(left: 20),
            // color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      widget.address,
                    ),
                    Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      '\$${widget.amount}',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.time),
                    Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightGreenAccent,
                      ),
                      child: Center(child: Text('Done')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
