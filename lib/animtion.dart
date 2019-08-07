import 'package:flutter/material.dart';

class animtion extends PageRouteBuilder {
  final Widget widget;

  animtion(this.widget)
      : super(
            transitionDuration: Duration(seconds: 1),
            // 构造器
            pageBuilder: (
              // 上下文和动画
              BuildContext context,
              Animation<double> animaton1,
              Animation<double> animaton2,
            ) {
              return widget;
            },
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animaton1,
              Animation<double> animaton2,
              Widget child,
            ) {
              // 需要什么效果把注释打开就行了
              // 渐变效果
              return FadeTransition(
                // 从0开始到1
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  // 传入设置的动画
                  parent: animaton1,
                  // 设置效果，快进漫出   这里有很多内置的效果
                  curve: Curves.fastOutSlowIn,
                )),
                child: child,
              );
            });
}
