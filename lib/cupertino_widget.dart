import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoIosWidget extends StatefulWidget {
  @override
  _CupertinoIosWidgetState createState() => _CupertinoIosWidgetState();
}

class _CupertinoIosWidgetState extends State<CupertinoIosWidget> {
  double _value1 = 10.0;
  bool _value2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
//        previousPageTitle: 'back',//返回
        middle: Text('CupertinoNavigationBar'),
        trailing: Text('Exit'),
        actionsForegroundColor: Colors.red, //按钮颜色及颜色
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CupertinoActivityIndicator(
                    radius: 20.0,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  CupertinoButton(
                      color: Colors.lightGreen,
                      child: Text('对话框弹出'),
                      onPressed: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: Text('标题'),
                                content: Text('这个文本内容'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('确定'),
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('取消'),
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      })
                ],
              ),
              Row(
                children: <Widget>[
                  CupertinoButton(
                      padding: EdgeInsets.all(20.0), //改变内边距
                      color: Colors.yellow, //改变颜色
                      borderRadius: BorderRadius.circular(20.0), //更改角度
                      pressedOpacity: 0.2, //点击的透明度
                      child: Text('button'),
                      onPressed: () {})
                ],
              ),
              Row(
                children: <Widget>[
                  CupertinoSlider(
                      value: _value1,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (double value) {
                        setState(() {
                          _value1 = value;
                        });
                      }),
                  Text('slider值：${_value1.toStringAsFixed(1)}') //（ toStringAsFixed(1)保留一位小数）
                ],
              ),
              Row(
                children: <Widget>[
                  CupertinoSwitch(
                      value: _value2,
                      onChanged: (bool value) {
                        setState(() {
                          _value2 = value;
                        });
                      })
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
