import 'dart:async';

import 'package:flutter/material.dart';


//Written by Josteve Adekanbi

class TheHome extends StatefulWidget {
  @override
  _TheHomeState createState() => _TheHomeState();
}

class _TheHomeState extends State<TheHome> with TickerProviderStateMixin {
  static double geometryValue = 20;
  double width = 200;
  double height = 200;
  BorderRadiusGeometry borderRadiusGeometry =
      BorderRadius.circular(geometryValue);
  Timer timer;
  bool offStageValue = true;
  var tween = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
      .chain(CurveTween(curve: Curves.easeIn));
  AnimationController _controller;
  bool done = false;
  double buttonWidth = 0;
  String buttonText = "";

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _animate,
        child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              width: width,
              height: height,
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                  color: Colors.purple[300],
                  borderRadius: borderRadiusGeometry),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 50),
                              child: RichText(
                                text: TextSpan(
                                  text: "Lavender\n",
                                  children: [
                                    TextSpan(
                                        text: r'$',
                                        style: TextStyle(fontSize: 15),
                                        children: [
                                          TextSpan(
                                              text: "19",
                                              style: TextStyle(fontSize: 30))
                                        ])
                                  ],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //The bottom that will come up
                  SlideTransition(
                    position: tween.animate((_controller)),
                    child: Offstage(
                      offstage: offStageValue,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              child: Text(
                                "Lavender",
                                style: TextStyle(fontSize: 28),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  ValueButton(text: "-"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ValueButton(
                                    text: "+",
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        r'$19',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      margin: EdgeInsets.only(right: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ValueFields(
                                    icon: Icons.watch,
                                    name: "Watch",
                                    value: "50 - 75%"),
                                ValueFields(
                                    icon: Icons.lightbulb_outline,
                                    name: "Light",
                                    value: "5k - 7klux"),
                                ValueFields(
                                    icon: Icons.terrain,
                                    name: "Terrain",
                                    value: "50 - 75h")
                              ],
                            ),
                            SizedBox(height: 30),
                            Align(
                              child: Text(
                                "Contained in glass polygonal florarium\n\nSize: 150x150 mm. Diameter",
                                textAlign: TextAlign.start,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AnimatedContainer(
                              child: Center(
                                  child: Text(
                                buttonText,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(8)),
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                              width: buttonWidth,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  _animateBox() {
    setState(() {
      _controller.forward();
      offStageValue = false;
    });
    Timer.periodic(Duration(microseconds: 1000), (timer) {
      if (buttonWidth < double.infinity) {
        buttonWidth += 10;
      } else {}
    });
    Timer(Duration(milliseconds: 1500), () {
      _changeText();
    });
  }

  _changeText() {
    setState(() {
      buttonText = "Add to Cart";
    });
  }

  _animate() {
    if (timer != null) {
      timer.cancel();
    }
    timer = Timer.periodic(Duration(microseconds: 1), (timer) {
      setState(() {
        if (geometryValue > -1) {
          geometryValue--;
        }
        if (width < MediaQuery.of(context).size.width) {
          width += 1000;
        }
        if (height < MediaQuery.of(context).size.height) {
          height += 3000;
        } else {
          done = true;
        }
      });
    });

    Timer.periodic(Duration(milliseconds: 1200), (timer) {
      if (done) {
        _animateBox();
      }
    });
  }

  _animateReverse() {
    timer.cancel();

    timer = Timer.periodic(Duration(microseconds: 1), (timer) {
      if (geometryValue < 20) {
        geometryValue++;
      }
      setState(() {
        if (width > 200) {
          width -= 1000;
        }
        if (height > 200) {
          height -= 5;
        }
      });
    });
  }
}

class ValueFields extends StatelessWidget {
  final String value;
  final String name;
  final IconData icon;

  ValueFields({this.value, this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[Icon(icon), Text(name)],
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }
}

class ValueButton extends StatelessWidget {
  final String text;

  ValueButton({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
    );
  }
}
