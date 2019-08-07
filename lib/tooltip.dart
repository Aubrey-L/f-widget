import 'package:flutter/material.dart';
import 'MyIcons.dart';
class tooltip extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: Text("tool"),
      ),
      body: new Column(
        children: <Widget>[
          new IconButton(icon:Icon(Icons.search) , onPressed: null,
            tooltip: 'search',
          ),
          new
            Tooltip(
                message: "删除",
                preferBelow:false,  //设置false就是在上面弹
                child: Icon(
                  Icons.delete,
                  size: 50.0,
                )),
          Icon(MyIcons.book,color: Colors.blue,),
          Icon(MyIcons.wechat,color: Colors.green,),
        ],
      ),
    );
  }

}
