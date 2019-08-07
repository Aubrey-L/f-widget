import 'dart:_http';

import 'package:flutter/material.dart';
import 'ClientFirst.dart';
import 'package:flutter/cupertino.dart';

class Client extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return cls();
  }
}

class cls extends State<Client> with SingleTickerProviderStateMixin {
  List<String> itemList = ['全部', '已收藏', '新创建', '有交易'];
  var text = [];
  TabController tabController;

  @override
  void initState() {
    // 添加监听器
    super.initState();
    tabController = TabController(vsync: this, length: itemList.length)
      ..addListener(() {
        switch (tabController.index) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 4,
      child: new Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                //左侧样式
                color: Colors.black,
              ),
              brightness: Brightness.light,
              //状态栏
              elevation: 0,
              //showdow
              title: Text(
                '客户',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              bottom: new TabBar(
                indicatorWeight: 2.0,
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.blue,
                controller: tabController,
                tabs: [
                  Tab(
                    text: itemList[0],
                  ),
                  Tab(
                    text: itemList[1],
                  ),
                  Tab(
                    text: itemList[2],
                  ),
                  Tab(
                    text: itemList[3],
                  )
                ],
              )),
          body: TabBarView(controller: tabController, children: [
            ClientFirst(0,1),
            ClientFirst(1,1),
            ClientFirst(2,1),
            ClientFirst(3,1),
          ])),
    );
  }
}
