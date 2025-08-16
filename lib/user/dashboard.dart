import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: TextStyle(fontWeight: FontWeight.bold),
              'Good morning, User',
            ),
            Text(
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              'Welcome To Bank',
            ),
          ],
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment(1, -1),
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Icon(Icons.notifications_on),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.home_filled, size: 30), Text('Home')],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_chart_sharp, size: 30),
                Text('History'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sync_alt_rounded, size: 30),
                Text('transfer'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.settings, size: 30), Text('Home')],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.supervised_user_circle_outlined, size: 30),
                Text('Profile'),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(style: TextStyle(fontSize: 20), 'Your Balance'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                          '\$3,000.00',
                        ),
                        Icon(Icons.remove_red_eye_sharp),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(345, 50),
                      ),
                      child: Text(
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        'Add Money',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          'Your cards',
                        ),
                        Row(
                          children: [
                            Icon(Icons.add),
                            Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              'New card',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 170,
                          width: 300,
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                    'N.',
                                  ),
                                  Image(
                                    width: 50,
                                    height: 50,
                                    image: AssetImage('images/mc.png'),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 403,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          'Transactions',
                        ),
                        Text(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          'See all',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TransactionHistory(
                          time: 'october, 12 8:30 PM',
                          address: 'uweawvuuxvuyxrau',
                          amount: -24.24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionHistory extends StatelessWidget {
  final String time;
  final String address;
  final double amount;

  const TransactionHistory({
    super.key,
    required this.time,
    required this.address,
    required this.amount,
  });

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
                      address,
                    ),
                    Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      '\$$amount',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(time),
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
