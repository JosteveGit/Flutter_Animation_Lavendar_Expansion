import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//class StaggeredGrid1 extends StatelessWidget {
//
//
//  List<StaggeredTile> _staggeredTiles = const [
//    StaggeredTile.count(4, 4),
//    StaggeredTile.count(4, 4),
//    StaggeredTile.count(4, 4),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return StaggeredGridView.count(
//      crossAxisCount: 4,
//      staggeredTiles: _staggeredTiles,
//      mainAxisSpacing: 10,
//      crossAxisSpacing: 10,
//      children: <Widget>[
//        MyCard(
//          value: "Sky Blue",
//          color: Colors.blue,
//          cost: "12",
//          height: 300,
//        ),
//        MyCard(
//          value: "Sky Blue",
//          color: Colors.blue,
//          cost: "12",
//          height: 300,
//        ),
//        MyCard(
//          value: "Sky Blue",
//          color: Colors.blue,
//          cost: "12",
//          height: 300,
//        ),
//      ],
//    );
//  }
//}
//
//class _HomeState extends State<Home> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child: StaggeredGrid1(),
//      ),
//    );
//  }
//}


enum Position{
  left,
  right
}

class MyCard extends StatefulWidget {
  final String value;
  final String cost;
  final Color color;
  final Color barColor;
  final Function onTap;
  final Position position;
  final bool isUp;

  MyCard({this.value, this.cost, this.color, this.barColor, this.onTap(), this.position, this.isUp = false});



  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with TickerProviderStateMixin {


  var tween;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Offset end;
    if(widget.position==Position.left){
      end = Offset(0.5,-0.5);
      if(widget.isUp){
        end = Offset(0.5,0.5);
      }
    }else{
      end = Offset(-0.5,-0.5);
      if(widget.isUp){
        end = Offset(-0.5,0.5);
      }
    }
    tween = Tween(begin: Offset.zero, end:end).chain(CurveTween(curve: Curves.bounceOut));
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: tween.animate(_controller),
      child: GestureDetector(
        onTap: (){
          _controller.forward();
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 20, left: 20),
          decoration:
              BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: "${widget.value}\n",
                        children: [
                          TextSpan(
                              text: r'$',
                              style: TextStyle(fontSize: 13),
                              children: [TextSpan(text: widget.cost, style: TextStyle(fontSize: 30))])
                        ],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    )),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: widget.barColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
