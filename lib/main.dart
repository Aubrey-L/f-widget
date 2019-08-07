import 'package:flutter/material.dart';
import 'Client.dart';
import 'Need.dart';
import 'Cs.dart';
import 'T.dart';
import 'bottomBar.dart';
import 'flow.dart';
import 'a.dart';
import 'sheet.dart';
import 'package:flutter/services.dart';
import 'tooltip.dart';
import 'Chip.dart';
import 'animtion.dart';
void main() {
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
systemNavigationBarColor: Colors.blue,
statusBarColor: Colors.blue,
));
  runApp(MyApp());
//SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);  //无状态栏
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '主页'),
    );
  }
}

class _text extends StatelessWidget {
  final String LeftTilte;
  final String rightTilte;
  final onTop;
  final onButon;
  final pciLfet;
  final pciRight;
  final context;

  const _text(
      {Key key,
      this.context,
      this.LeftTilte,
      this.rightTilte,
      this.onTop,
      this.onButon,
      this.pciLfet,
      this.pciRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new Expanded(
            flex: 1,
            child: Container(
              height: 45.0,
              margin: EdgeInsets.fromLTRB(17.0, 17.0, 17.0, 0),
              child: FlatButton(
                  color: Colors.white,
                  onPressed: onTop,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 24.0,
                        height: 24.0,
                        child: CircleAvatar(
                          backgroundImage: new AssetImage(
                            'images/five.png',
                          ),
                          backgroundColor: Colors.teal,
                        ),
                      ),
                      Container(
                        child: Text('${LeftTilte}'),
                        margin: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      )
                    ],
                  )),
            )),
        new Expanded(
            flex: 1,
            child: Container(
              height: 45.0,
              margin: EdgeInsets.fromLTRB(0, 17.0, 17.0, 0),
              child: FlatButton(
                  color: Colors.white,
                  onPressed: onButon,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 24.0,
                        height: 24.0,
                        child: CircleAvatar(
                          backgroundImage: new AssetImage(
                            'images/five.png',
                          ),
                          backgroundColor: Colors.teal,
                        ),
                      ),
                      Container(
                        child: Text('${rightTilte}'),
                        margin: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      )
                    ],
                  )),
            )),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          color: Colors.black12,
          height: double.infinity,
          child: new Column(
            children: <Widget>[
//              RaisedButton(onPressed: () {
//                Scaffold.of(context).showSnackBar(SnackBar(
//                    content: Text('当前值已修改'),
//                    action: SnackBarAction(
//                      label: '撤销',
//                    ),
//                    duration: Duration(milliseconds: 2000)));
//              }),

//                RaisedButton(onPressed: () => {
//        Scaffold.of(context).showSnackBar(SnackBar(
//        content: Text('当前值已修改'),
//        action: SnackBarAction(label: '撤销', ),
//        duration: Duration(milliseconds: 2000)
//        ) )},

              _text(
                  LeftTilte: '客户列表',
                  rightTilte: '需求列表',
                  onTop: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Client()));
                  },
                  onButon: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Need()));
                  }),
              _text(
                  LeftTilte: '顶部tab',
                  rightTilte: '顶部控件',
                  onTop: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new Cs()));
                  },
                  onButon: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new BasicAppBarSample()));
                  }),
              _text(
                  LeftTilte: '底部tab',
                  rightTilte: 'ListTile',
                  onTop: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new Bar()));
                  },
                  onButon: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new a()));
                  }),
              _text(
                  LeftTilte: '弹窗中间',
                  rightTilte: '自定义流程图',
                  onTop: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'Flutter 入门指北',
                      // App 的版本号
                      applicationVersion: '0.1.1',
                      // App 基本信息下面会显示一行小字，主要用来显示版权信息
                      applicationLegalese:
                          'Copyright: this is a copyright notice topically',
                      // App 的图标
                      applicationIcon: Icon(
                        Icons.android,
                        size: 28.0,
                      ),
                      children: <Widget>[
                        Text('我是个比较正经的对话框内容...你可以随便把我替换成任何部件，只要你喜欢(*^▽^*)'),
                        Text('11111')
                      ],
                    );
                  },
                  onButon: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new flow()));
                  }),
              _text(
                  LeftTilte: '弹窗',
                  rightTilte: 'tooltip',
                  onTop: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new sheet()));
                  },
                  onButon: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new tooltip()));
                  }),
              _text(
                  LeftTilte: 'chip',
                  rightTilte: '日期',
                  onTop: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new WrapPage()));
                  },
                  onButon: () {
//                    Navigator.push(context,
//                        new MaterialPageRoute(builder: (context) => new MyHomePage()));\

                        // 调用函数打开
                        showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
                          lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
                        ).then((DateTime val) {
                          print(val);   // 2018-07-12 00:00:00.000
                        }).catchError((err) {
                          print(err);
                        });


                  }),
              _text(
                  LeftTilte: '时间',
                  rightTilte: '改变跳转方式',
                  onTop: () {
                    showTimePicker(
                      context: context,
                      initialTime: new TimeOfDay.now(),
                    ).then((val) {
                      print(val);
                    }).catchError((err) {
                      print(err);
                    });
                  },
                  onButon: () {
                    Navigator.of(context).push(animtion(tooltip()));
                  }),
            ],
          )),
      floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => {}, child: Icon(Icons.send))),
    );
  }
}
