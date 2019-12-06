import 'package:challenge/challenge2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(child: Icon(Icons.menu), margin: EdgeInsets.all(8),),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        child: Icon(Icons.shopping_cart, color: Colors.black,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(left: 10),
                    child: RichText(
                      textAlign: TextAlign.start,
                     text: TextSpan(
                       text: "Choose your new\n",
                       style: TextStyle(fontSize: 30, color: Colors.black),
                       children: [
                         TextSpan(
                           text: "green friend",
                           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)
                         )
                       ]
                     ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverStaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: <Widget>[
                        MyCard(
                          color: Colors.blue[300],
                          value: "Sky Blue",
                          cost: "12",
                          barColor: Colors.blue[200],
                          position: Position.left,
                          isUp: true,
                        ),
                        MyCard(
                          color: Colors.purple[300],
                          value: "Lavendar",
                          cost: "19",
                          barColor: Colors.purple[200],
                          position: Position.right,
                          isUp: true,
                        ),
                        MyCard(
                          color: Colors.green[300],
                          value: "Green Life",
                          cost: "17",
                          barColor: Colors.green[200],
                          position: Position.right,
                        ),
                        MyCard(
                          color: Colors.amber[300],
                          value: "Yellow Sun",
                          cost: "14",
                          barColor: Colors.amber[200],
                          position: Position.left,
                        ),
                        MyCard(
                          color: Colors.red[400],
                          value: "Red",
                          cost: "21",
                          barColor: Colors.red[300],
                          position: Position.right,
                        ),
                        MyCard(
                          color: Colors.blueGrey[200],
                          value: "Grey Blue",
                          cost: "19",
                          barColor: Colors.blueGrey[100],
                          position: Position.left,
                        ),
                        MyCard(
                          color: Colors.deepOrange[400],
                          value: "Orange",
                          cost: "14",
                          barColor: Colors.deepOrange[300],
                          position: Position.right,
                        ),
                        MyCard(
                          color: Colors.pink[300],
                          value: "Pink",
                          cost: "21",
                          barColor: Colors.pink[200],
                          position: Position.left,
                        ),
                        MyCard(
                          color: Colors.purple[300],
                          value: "Lavendar",
                          cost: "19",
                          barColor: Colors.purple[200],
                          position: Position.right,
                        ),
                      ],
                      staggeredTiles: [
                        StaggeredTile.count(2, 3),
                        StaggeredTile.count(2, 2),
                        StaggeredTile.count(2, 3),
                        StaggeredTile.count(2, 3),
                        StaggeredTile.count(2, 2),
                        StaggeredTile.count(2, 3),
                        StaggeredTile.count(2, 3),
                        StaggeredTile.count(2, 2),
                        StaggeredTile.count(2, 2)
                      ],
                    )
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
