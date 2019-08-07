import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
class NeedFirst extends StatefulWidget {
  final SearchType;
  var PageSize;
  NeedFirst(this.SearchType,this.PageSize);
  @override
  State<StatefulWidget> createState() {
    return fist(SearchType,PageSize);
  }
}
class fist extends State {
  final  SearchType;
  var  PageSize;
  fist(this.SearchType,this.PageSize);
  var list=[];
  ScrollController _scrollController = new ScrollController();
  loadData() async {
    print("SearchType===========${SearchType}");
    try {
      String loadRUL =
          "http://wx.icvip.com/api/Order/Rfq/GetList?key=fiERkmIZk%2b7VFGYxCuw15J1nKwlI1t%2bR1PgNElyWKNQYewjWTkWNMys5rEtbQSaQ&PageIndex=${PageSize}&PageSize=10&SearchType=${SearchType}";
      var response=    await  Dio().request(loadRUL);
      final body = json.decode(response.toString());
      print('item===${body}');
      setState(() {
        list.addAll(body['ReValue']['Data']) ;
      });
      print('item===${list.length}');
    } catch (e) {
      print(e);
    }

  }
  @override
  void initState() {
    // 添加监听器
    super.initState();
    loadData();
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        setState(() {
          PageSize++;
        });
        loadData();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor:list.length!=0? Colors.black12:Colors.white,
        body: getData(),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
  getData(){
    if(list.length!=0){
      return  new ListView.builder(
          itemCount: list.length,
          controller: _scrollController,
          itemBuilder: (BuildContext  context,int  i) => new Container( //和颜色不能一起decoration:color
            color: Colors.white,
            margin:i==0? EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0): EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
            width: double.infinity,
            child: FlatButton(
                onPressed: (){
                  print(list[i]);
                },
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: <Widget>[
                            textAndText('客户编号:', '${list[i]['CustomerCode']}'),
                            textAndText('中文名:',  '${list[i]['CName']}' ),
                            textAndText('电话:',  '${list[i]['Tel']}'),
                            textAndText('需求数量:', '${list[i]['RfqCount']}' ),
                            textAndText('订单数量:', '${ list[i]['SOCount']}'),
                            textAndText('订单金额:',  '${list[i]['FinSOAmount']}'),
                            textAndText('应收款项:',  '${list[i]['FinSONotRecAmount']}'),
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text('222'),
                      ),
                    )
                  ],
                )),
          ));
    }else{
      return new Center(

        child: CupertinoActivityIndicator(),
      );
    }
  }
}

class textAndText extends StatelessWidget {
  final leftName;
  final rightName;

  textAndText(this.leftName, this.rightName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[Text(this.leftName),  new Container(
          margin: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          width: 200.0,
          child: Text(this.rightName,    textAlign: TextAlign.left,
            softWrap: true,//设置是否自动换行
            textDirection: TextDirection.ltr,
            overflow: TextOverflow.fade
            ,) ,)],
      ),
    );
  }
}
