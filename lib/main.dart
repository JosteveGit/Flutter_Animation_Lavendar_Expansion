import 'package:challenge/challenge2.dart';
import 'package:challenge/staggered_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}


class MyCard extends StatelessWidget {
  final IconData icon;
  final String time;
  final String header;
  final String desc;
  final Color color;

  MyCard({this.icon, this.time, this.header, this.desc, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          shape: BoxShape.rectangle,
          color: color),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                )
              ],
            ),
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        header,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        desc,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.fade,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  final String topic;
  final String value;

  Bottom({this.topic, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 20, left: 20, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            topic,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 50,
          mainAxisSpacing: 10,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: <Widget>[
                Text("hey"),
              ],
            ),
            color: Colors.blue,
          );
        });
  }
}

class Bla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridViewBuilder(),
      ),
    );
  }
}
