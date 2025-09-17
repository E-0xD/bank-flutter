// import 'package:bank/http/login.dart';
import 'package:flutter/material.dart';
import 'package:bank/partials/transaction_history.dart';
import "package:bank/partials/card.dart";

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _addMoney = GlobalKey<FormState>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  List<({String name, String date, String amount})> transactions = [];

  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController date = TextEditingController();

  String? validateInput(String value) {
    if (value.trim() == "") {
      return "input can't be epmty";
    } else {
      return null;
    }
  }

  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home_filled, size: 30), text: 'Home'),
            Tab(icon: Icon(Icons.add_chart_sharp, size: 30), text: 'History'),
            Tab(icon: Icon(Icons.sync_alt_rounded, size: 30), text: 'transfer'),
            Tab(icon: Icon(Icons.settings, size: 30), text: 'Settings'),
            Tab(
              icon: Icon(Icons.supervised_user_circle_outlined, size: 30),
              text: 'Profile',
            ),
          ],
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(child: _dashboard(context)),
            SizedBox(
              width: 300,
              height: 400,
              child: ListTile(
                leading: Icon(Icons.abc_outlined),
                title: Text("data"),
                subtitle: Text("data subtilte"),
              ),
            ),
            Container(color: Colors.blue, width: 300, height: 400),
            Container(color: Colors.black, width: 300, height: 400),
            Container(color: Colors.pink, width: 300, height: 400),
          ],
        ),
      ),
    );
  }

  Column _dashboard(BuildContext context) {
    return Column(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(style: TextStyle(fontSize: 20), 'Your Balance'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                    '\$$totalAmount',
                  ),
                  Icon(Icons.remove_red_eye_sharp),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _addMoney,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              validator: (value) => validateInput(value!),
                              decoration: InputDecoration(
                                labelText: 'Enter Recipient name',
                              ),
                            ),
                            TextFormField(
                              validator: (value) => validateInput(value!),
                              controller: amount,
                              decoration: InputDecoration(labelText: 'Amount'),
                            ),
                            TextFormField(
                              validator: (value) => validateInput(value!),
                              controller: date,
                              decoration: InputDecoration(
                                labelText: 'Date and Time',
                              ),
                            ),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_addMoney.currentState!.validate()) {
                                    _addMoney.currentState!.reset();

                                    setState(() {
                                      transactions.add((
                                        amount: amount.text,
                                        name: name.text,
                                        date: date.text,
                                      ));

                                      totalAmount += int.parse(amount.text);
                                    });

                                    name.clear();
                                    date.clear();
                                    amount.clear();
                                  }
                                },
                                child: Text("Add Money"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Cards();
                  },
                ),
              ),
            ],
          ),
        ),

        Container(
          height: MediaQuery.of(context).size.height * 0.6,
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    'Transactions',
                  ),
                  Text(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    'See all',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                  itemCount: transactions.length,
                  

                  itemBuilder: (context, index) {
                  
                    var item = transactions.reversed.toList()[index];
                    return TransactionHistory(
                      time: item.date,
                      address: item.name,
                      amount: item.amount,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class Card extends StatelessWidget {
//   const Card({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 170,
//       width: 300,
//       margin: EdgeInsets.only(right: 20),
//       padding: EdgeInsets.all(13),
//       decoration: BoxDecoration(
//         color: Colors.green[300],
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                 'N.',
//               ),
//               Image(width: 50, height: 50, image: AssetImage('images/mc.png')),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text('Debit card'),
//                   Row(
//                     children: [
//                       Icon(Icons.horizontal_rule),
//                       Text(
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                         '4098',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 width: 100,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Icon(Icons.remove_red_eye_outlined),
//                     Text('Details'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
