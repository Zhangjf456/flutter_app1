import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LayoutWidget extends StatefulWidget {
  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'back',
        middle: Text('layout'),
        trailing: Text('exit'),
        actionsForegroundColor: Colors.yellow,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 100.0,
                    color: Colors.green,
                    child: Align(
                      alignment: FractionalOffset(1.0, 0.0), //xy轴
                      child: Container(
                        color: Colors.red,
                        width: 40.0,
                        height: 50.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    color: Colors.red,
                    child: AspectRatio(
                      aspectRatio: 4.0 / 4.0, //aspectRatio:1/4，所以子widget的h:200.0,w:50.0
                      child: Container(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Offstage(
                    offstage: false,
                    child: Container(height: 20.0, color: Colors.teal, child: Text('offstage：后台')),
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    child: OverflowBox(
                      maxHeight: 50.0,
                      maxWidth: 60.0,
                      minHeight: 40.0,
                      minWidth: 50.0,
                      child: Text('wode '),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 200.0,
                          width: 100.0,
                        ),
                        Container(
                          child: Transform(
                            transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
                            child: Container(
                              color: Colors.lightGreenAccent,
                              width: 60.0,
                              height: 400.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 10.0, //主轴方向间距（水平方向间距）
                runSpacing: 10.0, //垂直方向间距

                children: <Widget>[
                  Chip(
                    label: Text('流式布局'),
                    avatar: new CircleAvatar(
                      child: Text('W'),
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
