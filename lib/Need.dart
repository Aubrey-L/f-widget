import 'package:flutter/material.dart';
import 'NeedFirst.dart';
import 'package:flutter/cupertino.dart';

class Need extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return cls();
  }
}

class cls extends State<Need> with SingleTickerProviderStateMixin {
  List<String> itemList = ['全部', '未报价', '有报价', '有订单','已失效'];
  var text = [];
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: itemList.length,
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
                '需求',
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
                  ),
                  Tab(
                    text: itemList[4],
                  )
                ],
              )),
          body: TabBarView(controller: tabController, children: [
            NeedFirst(0,1),
            NeedFirst(1,1),
            NeedFirst(2,1),
            NeedFirst(3,1),
            NeedFirst(4,1),
          ])),
    );
  }
}
