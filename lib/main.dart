import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';

import 'UI/Intray/intray_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.pink,
      title: 'TODO app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: darkGreyColor,
        accentColor: darkRedAccentColor,
      ),
      home: MyHomePage(title: 'TODO app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.rss_feed),
                ),
                Tab(
                  icon: Icon(Icons.perm_identity),
                )
              ],
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              labelColor: darkRedAccentColor,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: [
                  Container(
                    color: darkGreyColor,
                    child: IntrayPage(),
                  ),
                  Container(
                    color: Colors.red,
                    child: Center(child: Text("Hello")),
                  ),
                  Container(
                    color: Colors.green,
                    child: Center(child: Text("There")),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 40),
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Intray",
                      style: intrayTitleStyle,
                    ),
                    Container(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 130, left: MediaQuery.of(context).size.width * 0.5 - 30),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                  backgroundColor: lightRedAccentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


