import 'package:bank/navigation/screen1.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("screen one"),
        toolbarHeight: 75,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: TabBar(
              controller: _controller,
              tabs: [
                Tab(text: "home", icon: Icon(Icons.home)),
                Tab(text: "about", icon: Icon(Icons.home)),
                Tab(text: "profile", icon: Icon(Icons.home)),
                Tab(text: "settings", icon: Icon(Icons.home)),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: TabBarView(
            controller: _controller,
            children: [
              Container(color: Colors.red, width: 300, height: 400),
              Container(color: Colors.blue, width: 300, height: 400),
              Container(
                color: Colors.yellow,
                width: 300,
                height: 400,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context)=> Screen1()));
                  },
                  child: Icon(Icons.abc),
                ),
              ),
              Container(color: Colors.black, width: 300, height: 400),
            ],
          ),
        ),
      ),

      bottomNavigationBar: TabBar(
        controller: _controller,
        tabs: [
          Tab(text: "home", icon: Icon(Icons.home)),
          Tab(text: "about", icon: Icon(Icons.home)),
          Tab(text: "profile", icon: Icon(Icons.home)),
          Tab(text: "settings", icon: Icon(Icons.home)),
        ],
      ),
    );
  }
}

