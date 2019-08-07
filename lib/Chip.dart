import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {

  // 生成历史数据
  final List<String> _list = List<String>.generate(10, (i) => 'ch1111ip$i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WrapPage'),
        ),
        body: Column(children: <Widget>[
          Wrap(
              spacing: 10,
              runSpacing: 5,
              children: _list.map<Widget>((s) {
                return Chip(
                  label: Text('$s'),
                  avatar: Icon(Icons.person),
                  deleteIcon: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onDeleted: () {
                    setState(() {
                      _list.remove(s); // 删除事件
                    });
                  },
                );
              }).toList()
          ),


        ],)
   );
  }
}
