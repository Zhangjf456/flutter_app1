import 'package:flutter/material.dart';

class LayoutListViewWidget extends StatefulWidget {
  @override
  _LayoutListViewWidgetState createState() => _LayoutListViewWidgetState();
}

class _LayoutListViewWidgetState extends State<LayoutListViewWidget> {
  int index = 0;
  List<Color> list = [Colors.pink, Colors.red, Colors.blue, Colors.yellow, Colors.brown];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Layout'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.blueGrey,
                  height: 70.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.white),
                  height: 100.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Frist',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Icon(Icons.four_k)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('订单数'),
                                Text('200110.00'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '銷售書',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                IndexedStack(
                    index: index,
                    children: list.map((item) {
                      return builderItem(item);
                    }).toList()),
                RaisedButton(
                    child: Text('點擊切換'),
                    onPressed: () {
                      setState(() {
                        index++;
                        if (index > 5) {
                          index = 0;
                        }
                      });
                    })
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Column(
                  children: <Widget>[Text('我的'), Icon(Icons.print)],
                ),
                Column(
                  children: <Widget>[Text('我的'), Icon(Icons.print)],
                ),
                Column(
                  children: <Widget>[Text('我的'), Icon(Icons.print)],
                )
              ],
            ),
            Table(children: [
              TableRow(children: [
                Text('一項'),
              ]),
            ]),
            Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Text('偉大的'),
                Text('偉大的'),
                Text('偉大的'),
                Text('偉大的'),
                Text('偉大的'),
                Text('偉大的'),
                Text('偉大的'),
                Text('偉大的'),
                Text('偉大的'),
              ],
            )
          ],
        ));
  }

  Widget builderItem(Color color) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: color,
      child: Text('點擊調整${list.indexOf(color)}'),
    );
  }
}
