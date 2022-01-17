

import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("透明度动画"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250.0,
            width: 120.0,
            ///背景
            color: Colors.blue[50],
            child: buildAnimatedOpacity(),
          ),
          RaisedButton(
            child: Text('修改透明度'),
            onPressed: () {
              setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
            },
          ),
        ],
      ),
    );
  }

  ///当前页面显示组件的透明度
  double opacityLevel = 1.0;
  ///构建透明动画组件[AnimatedOpacity]
  AnimatedOpacity buildAnimatedOpacity() {
    return AnimatedOpacity(
      ///透明度
      opacity: opacityLevel,
      ///过渡时间
      duration: Duration(milliseconds: 2000),
      ///动画插值器
      curve: Curves.linear,
      ///动画过渡完毕的回调
      onEnd: () {
      },
      ///子Widget
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
