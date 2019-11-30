import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'advancedwidget.dart';
import 'layout2widget.dart';
import 'layout_widget.dart';

class BasicBottomWidget extends StatefulWidget {
  @override
  _BasicBottomWidgetState createState() => _BasicBottomWidgetState();
}

class _BasicBottomWidgetState extends State<BasicBottomWidget> {
  bool value = true;
  String value1 = '点击';
  TextEditingController controller = TextEditingController();
  bool checkValueA = true;
  bool checkValueB = false;
  bool checkValueC;
  int radioValue = 0;

  bool switchValue1 = true;
  double _slider1 = 20.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('按钮组合'),
              centerTitle: true,
              elevation: 0.0,
              actions: <Widget>[
                PopupMenuButton(
                    icon: Icon(Icons.menu),
                    onSelected: (value1) {
                      setState(() {
                        this.value1 = '选项为$value1';
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuItem<String>>[
                        PopupMenuItem(child: Text('选择1'), value: '1'),
                        PopupMenuItem(child: Text('选择2'), value: '2'),
                        PopupMenuItem(child: Text('选择3'), value: '3'),
                      ];
                    })
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(32.0),
                child: TabBar(
                    labelStyle: TextStyle(fontSize: 15.0),
                    unselectedLabelStyle: TextStyle(fontSize: 12.0),
                    labelColor: Colors.pinkAccent,
                    unselectedLabelColor: Colors.yellow,
                    indicatorWeight: 8.0,
                    indicator: BoxDecoration(border: Border(bottom: BorderSide(width: 4.0))),
                    tabs: <Widget>[Text('RasicBottom'), Text('Drawer'), Text('TabBar')]),
              ),
            ),
            drawer: Drawer(
                child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('易烊千玺'),
                  accountEmail: Text('yiyangqianxilike.com'),
                  currentAccountPicture: Image.network(
                      'https://img04.sogoucdn.com/net/a/04/link?url=https%3A%2F%2Fi04piccdn.sogoucdn.com%2Fa7b40a1c92c53f3c&appid=122'),
                ),
                ListTile(
                  trailing: Icon(Icons.build),
                  title: Text('首先请设置喜欢'),
                ),
                ListTile(
                  trailing: Icon(Icons.favorite),
                  title: Text('其次喜欢请加1'),
                ),
                AboutListTile(
                  child: Text('关于'),
                  icon: Icon(Icons.settings_input_antenna),
                  applicationIcon: Icon(Icons.settings),
                  applicationLegalese: '申请发文，可编辑里面的Widget',
                  applicationVersion: 'v0.0.1',
                  aboutBoxChildren: <Widget>[Icon(Icons.directions)],
                )
              ],
            )),
            body: TabBarView(children: <Widget>[
              ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RaisedButton(
                              color: Colors.teal,
                              textColor: Colors.blue,
                              child: Text(
                                '改变文本背景颜色',
                              ),
                              onPressed: () {}),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          RaisedButton(
                              onPressed: () {},
                              splashColor: Colors.pinkAccent,
                              child: Text('点击有水波纹的颜色变化,添加圆角Shape'),
                              shape: StadiumBorder(
                                  side: BorderSide(width: 2.0, color: Colors.yellow))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {},
                            child: Text(
                              '添加高亮颜色及阴影部分',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.dashed),
                            ),
                            highlightColor: Colors.greenAccent,
                            elevation: 50.0,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton.icon(
                            onPressed: () {},
                            highlightColor: Colors.greenAccent,
                            textColor: Colors.white,
                            color: Colors.blueGrey,
                            label: Text('我的'),
                            icon: Icon(Icons.directions),
                          ), //无阴影的bottom
                          RaisedButton.icon(
                              onPressed: () {}, icon: Icon(Icons.build), label: Text('设置')),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            iconSize: 40.0,
                            onPressed: () {
                              setState(() => value = !value);
                            },
                            color: value ? Colors.red : Colors.grey,
                          ),
                          IconButton(
                              icon: Icon(Icons.favorite),
                              tooltip: '工具提示', //长按有文字提示
                              color: Colors.yellow,
                              highlightColor: Colors.green, //提示的颜色
                              onPressed: () {}),
                          Text(value1)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(onPressed: () {}, child: Text('取消')),
                          FlatButton(
                            onPressed: () {},
                            child: Text('确定'),
                            color: Colors.green,
                          ), //水平排列的按钮组，一般用于dialog底部按钮排列
                        ],
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  labelText: 'Username', hintText: '请输入你的账户'), //输入装饰：文本框
                              style: TextStyle(color: Colors.green, fontSize: 20.0),
                              maxLines: 1, //最多行为1
                              maxLength: 50, //最多可输入
                              autocorrect: true, //
                            ),
                            SizedBox(height: 10.0), //行距
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: '请输入密码',
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true, //是否为密码
                            ),
                            Theme(
                              data: ThemeData(primaryColor: Colors.green),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '改变hintText颜色、边框颜色、边框',
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                    value: checkValueA,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkValueA = value;
                                      });
                                    }),
                                Checkbox(
                                    value: checkValueB,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkValueB = value;
                                      });
                                    }),
                                Checkbox(
                                    value: checkValueC,
                                    activeColor: Colors.red,
                                    tristate: true,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkValueC = value;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                    value: 1,
                                    groupValue: radioValue,
                                    onChanged: (int value) {
                                      setState(() {
                                        radioValue = value;
                                      });
                                    }),
                                Radio(
                                    value: 3,
                                    activeColor: Colors.red,
                                    groupValue: radioValue,
                                    onChanged: (int value) {
                                      setState(() {
                                        radioValue = value;
                                      });
                                    }),
                                Radio(
                                    value: 2,
                                    groupValue: radioValue,
                                    onChanged: (int value) {
                                      setState(() {
                                        radioValue = value;
                                      });
                                    }) //单选框，允许用户从一组中选择一个选项
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Switch(
                                    activeColor: Colors.lightGreenAccent,
                                    value: switchValue1,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchValue1 = value;
                                      });
                                    }) //用于切换一个单一状态
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Slider(
                                    value: _slider1,
                                    min: 10.0,
                                    max: 200.0,
                                    onChanged: (double value) {
                                      setState(() {
                                        _slider1 = value;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context, CupertinoPageRoute(builder: (_) => LayoutWidget()));
                        },
                        child: Text('layout'),
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (_) => LayoutListViewWidget()));
                            },
                            child: Container(
                                color: Colors.blueGrey,
                                height: 40.0,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('wode '),
                                )),
                          ),
                        ],
                      ),
                      RaisedButton(
                          child: Text('进阶篇'),
                          onPressed: () {
                            Navigator.push(
                                context, CupertinoPageRoute(builder: (_) => AdvancedTextWidget()));
                          })
                    ],
                  ),
                ],
              ),
              Text('5895')
            ])));
  }
}
