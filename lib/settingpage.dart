import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'selecttextitem.dart';
import 'btnContentView.dart';
import 'BtbItemView.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  // @override
  // State<MultipleBarChartBasic> createState() => MultipleBarChartBasicState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: Container(
        // color: Colors.blue,
       child:Column(children: <Widget>[
          btnContentView(),
         Container(
           padding: EdgeInsets.only(top: 20,right: 0,left: 0),
           height: 220,
          child: Row(children: <Widget>[
            Column(children: <Widget>[
              Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width/2,
                height: 90,
                // padding: EdgeInsets.only(top: 0,right: 10,left: 10),
                alignment: Alignment.center,
                child: BtbItemView(
                  title: '睡眠数据',
                  imageName: 'images/setting_sleepIcon.png',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 90,
                margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
                alignment: Alignment.center,
                child: BtbItemView(
                  title: '环境数据',
                  imageName: 'images/setting_assetIcon.png',
                ),
              ),
            ],
            ),
            Column(children: <Widget>[
              Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width/2,
                height: 90,
                // padding: EdgeInsets.only(top: 0,right: 10,left: 10),
                alignment: Alignment.center,
                child: BtbItemView(
                  title: '健康数据',
                  imageName: 'images/setting_assetIcon.png',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 90,
                margin: EdgeInsets.only(top: 10, left: 0, right:0, bottom: 0),
                alignment: Alignment.center,
                child: BtbItemView(
                  title: '宝宝动态',
                  imageName: 'images/setting_activeIcon.png',
                ),
              ),
            ],
            ),
           ]),
         ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
            height: 240,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.white, blurRadius: 15.0)],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 0)),
            child: ListView(
              // scrollDirection:Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                SelectTextItem(
                  title: '设备设置',
                ),
                SelectTextItem(
                  title: '账号设置',
                  textAlign: TextAlign.end,
                  contentStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF333333),
                  ),
                ),
                SelectTextItem(
                  title: '帮助与反馈',
                ),
                SelectTextItem(
                  title: '软件版本',
                  content: 'v1.1.2',
                  isShowArrow: false,
                  textAlign: TextAlign.end,
                  contentStyle: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
