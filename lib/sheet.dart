import 'package:flutter/material.dart';

class sheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dailog();
  }
}

class dailog extends State<sheet> {
  var count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 自增操作
  increase() {
    setState(() => count++);
  }

  // 自减操作
  decrease() {
    setState(() => count--);
  }

  _changeValue(BuildContext context) {
    increase();
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('当前值已修改'),
        action: SnackBarAction(label: '撤销', onPressed: decrease),
        duration: Duration(milliseconds: 2000)));
  }

  _showBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => ListView(
              // 生成一个列表选择器
              children: List.generate(
            20,
            (index) => InkWell(
                child: Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: Text('Item ${index + 1}')),
                onTap: () {
                  print('tapped item ${index + 1}');
                  Navigator.pop(context);
                }),
          )),
    );
  }
  _showSimpleDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
          title: Text('我是个比较正经的标题...\n选择你的性别'),
          // 这里传入一个选择器列表即可
          children: [
            Text("难"),
            Text("易"),
          ]
              .map((gender) => InkWell(
            child: Container(height: 40.0, child: Text('1'), alignment: Alignment.center),
            onTap: () {
              Navigator.pop(context);
//              Fluttertoast.showToast(msg: '你选择的性别是 $gender');
            },
          ))
              .toList(),
        ));
  }


  _showAlertDialog(BuildContext context) {
    showDialog(
        // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text('我是个标题...嗯，标题..'),
//          titleTextStyle: TextStyle(color: Colors.purple), // 标题文字样式
//          content: Text(r'我是内容\(^o^)/~, 我是内容\(^o^)/~, 我是内容\(^o^)/~'),
//          contentTextStyle: TextStyle(color: Colors.green), // 内容文字样式
//          backgroundColor: CupertinoColors.white,
//          elevation: 8.0, // 投影的阴影高度
              semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
              shape: Border.all(),
              // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
              actions: <Widget>[
                // 点击增加显示的值
                FlatButton(onPressed: increase, child: Text('点我增加')),
                // 点击减少显示的值
                FlatButton(onPressed: decrease, child: Text('点我减少')),
                // 点击关闭 dialog，需要通过 Navigator 进行操作
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('你点我试试.')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("弹窗"),
      ),
      body: Column(children: <Widget>[
        Text('当前值：$count', style: TextStyle(fontSize: 20.0)),
        Expanded(
            flex: 1,
            // 为了方便拓展，我这边提取了 `snackBar` 的方法，并把按钮放在列表
            child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: <Widget>[
                  // SnackBar 需要提供一个包含 context，但是 context 不能是 Scaffold 节点下的 context，所以需要通过 Builder 包裹一层
                  Builder(
                      builder: (context) => RaisedButton(
                          onPressed: () => _changeValue(context),
                          child: Text('底部弹窗'))),
                ])),
        Expanded(
            flex: 1,
            // 为了方便拓展，我这边提取了 `snackBar` 的方法，并把按钮放在列表
            child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: <Widget>[
                  // SnackBar 需要提供一个包含 context，但是 context 不能是 Scaffold 节点下的 context，所以需要通过 Builder 包裹一层
                  Builder(
                      builder: (context) => RaisedButton(
                          onPressed: () => _showBottomSheet(context),
                          child: Text('list列表'))),
                ])),
        Expanded(
            flex: 1,
            // 为了方便拓展，我这边提取了 `snackBar` 的方法，并把按钮放在列表
            child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: <Widget>[
                  // SnackBar 需要提供一个包含 context，但是 context 不能是 Scaffold 节点下的 context，所以需要通过 Builder 包裹一层
                  Builder(
                      builder: (context) => RaisedButton(
                          onPressed: () => _showAlertDialog(context),
                          child: Text('按键弹窗'))),
                ])),
        Expanded(
            flex: 1,
            // 为了方便拓展，我这边提取了 `snackBar` 的方法，并把按钮放在列表
            child: ListView(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: <Widget>[
                  // SnackBar 需要提供一个包含 context，但是 context 不能是 Scaffold 节点下的 context，所以需要通过 Builder 包裹一层
                  Builder(
                      builder: (context) => RaisedButton(
                          onPressed: () => _showSimpleDialog(),
                          child: Text('自定义弹窗'))),
                ])),
      ]),
    );
  }
}
