import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cupertino_widget.dart';

class ComponentPickerWidget extends StatefulWidget {
  @override
  _ComponentPickerWidgetState createState() => _ComponentPickerWidgetState();
}

class _ComponentPickerWidgetState extends State<ComponentPickerWidget> {
//  String dataString = '选择日期';
//  String timeString = '选择时间';
  DateTime dataTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  List<bool> _isExpand = [false, false];

  bool select = false;
  int _index = 1;

  double loading = 0.0;
  int percentage = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        loading += 0.008;
        percentage = (loading * 100).floor();
        if (loading >= 1) timer.cancel();
      });
    });
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Picker'),
          centerTitle: true,
          elevation: 0.0,
          bottom: PreferredSize(child: Text('时间选择'), preferredSize: Size.fromHeight(30.0)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: dataTime,
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2020));
                        setState(() {});
                      },
                      child: Text('选择时间'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        showTimePicker(context: context, initialTime: timeOfDay);
                        setState(() {});
                      },
                      child: Text('選擇時間'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title: Text('我的標題'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {},
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.print,
                                          color: Colors.lightGreenAccent,
                                        ),
                                        Text('簡單的顯示框架')
                                      ],
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      child: Text('點擊顯示對話'), //'简单对话框可以显示附加的提示或操作'
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('提示信息'),
                                content: Text('是否需要學習， barrierDismissible: false表示点击对话框外不可取消对话框'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('取消')),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('確定'))
                                ],
                              );
                            });
                      },
                      child: Text('提示信息'),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(child: Builder(builder: (BuildContext context) {
                    return RaisedButton(
                      onPressed: () {
                        showBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(color: Colors.green),
                                child: Padding(
                                  padding: const EdgeInsets.all(120.0),
                                  child: Text('使用builder才能下滑隐藏'),
                                ),
                              );
                            });
                      },
                      child: Text('下拉隐藏showBottom'),
                    );
                  })),
                  RaisedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.all(120.0),
                                child: Text('点击任意地方隐藏'),
                              ),
                            );
                          });
                    },
                    child: Text('点击隐藏ModalBottom'),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpand) {
                      setState(() {
                        _isExpand[index] = !isExpand;
                      });
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder: (BuildContext context, bool flag) {
                            return Text('我的');
                          },
                          body: Text('下拉内容'),
                          isExpanded: _isExpand[0])
                    ],
                  )
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Builder(builder: (BuildContext context) {
                      return RaisedButton(
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                              action: SnackBarAction(
                                label: '可点击按钮',
                                onPressed: () {},
                              ),
                              content: Text('提示信息是否需要继续,如不需要五秒后自动消失')));
                        },
                        child: Text('点击详情'),
                      );
                    })
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.lightGreen,
                            child: Text('张'),
                          ),
                          label: Text('junfang'),
                        ),
                        Chip(
                            deleteIcon: Icon(Icons.delete_forever),
                            deleteIconColor: Colors.lightGreen,
                            onDeleted: () {},
                            deleteButtonTooltipMessage: '是否需要删除',
                            label: Text('长按删除图标')),
                        InputChip(
                          onPressed: () {},
                          label: Text('请长按提示信息'),
                          tooltip: 'InputChip是一个复杂的标签',
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Wrap(
                            children: List<Widget>.generate(3, (int index) {
                          return ChoiceChip(
                            label: Text('選擇$index'),
                            selectedColor: Colors.lightGreen,
                            selected: _index == index,
                            onSelected: (bool select) {
                              setState(() {
                                _index = select ? index : null;
                              });
                            },
                          );
                        }))
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => CupertinoIosWidget()));
                },
                child: Card(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 48.0, bottom: 48.0),
                            child: Text('Card擁有一個圓角和陰影'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    LinearProgressIndicator(
                      value: loading,
                    ),
                    Text('$percentage%'),
                    LinearProgressIndicator(),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                        CircularProgressIndicator(
                          value: loading,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
