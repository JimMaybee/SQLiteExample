import 'package:SQLite/data_page.dart';
import 'package:SQLite/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.login)),
                Tab(icon: Icon(Icons.data_usage)),
              ],
            ),
            title: Center(child: Text('SQLite Demo')),
          ),
          body: TabBarView(
            children: [
              HomePageForm(),
              DataPage(),
            ],
          ),
        ),
      ),
    );
  }
}
