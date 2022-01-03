import 'package:flutter/material.dart';

class SleepTopItem extends StatelessWidget {
  const SleepTopItem({
    Key key,
    @required this.topTitle,
    @required this.bottomInfo,
    @required this.rightInfo,
    this.textAlign: TextAlign.start,
    this.titleStyle,
    this.contentStyle,
    this.onTap,
    this.imageName,
  }): super(key: key);

  final GestureTapCallback onTap;
  final TextAlign textAlign;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final String topTitle;//头部文字
  final String bottomInfo;//底部文字
  final String imageName;//左侧图片名字 不传则不显示图片
  final String rightInfo;//右边文字

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 5),
        child: Ink(
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 20,top: 10),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    this.imageName,
                    width: 35,
                    height: 35,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 65,top: 10),
                  child: Text(
                      this.topTitle,
                      overflow: TextOverflow.ellipsis,
                      style: this.contentStyle ?? new TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFCCCCCC),
                      )
                  ),
                ),
                Container(
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 65, top: 25),
                  child: Text(
                      this.bottomInfo,
                      overflow: TextOverflow.ellipsis,
                      style: this.contentStyle ?? new TextStyle(
                        fontSize: 30.0,
                        color: Color(0xFF333333),
                      )
                  ),
                ),
                Container(
                  // color: Colors.white,
                  margin: EdgeInsets.only(top: 5, left: MediaQuery.of(context).size.width/2-20, right: 20, bottom: 0),
                  height: 70,
                  padding: EdgeInsets.only(left: 0, top: 0),
                  // width: 80,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: const Color(0xffe4e4e4), blurRadius: 15.0)],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 3)),
                ),
                Container(
                  // color: Colors.red,
                  padding: EdgeInsets.only(right: 30, top: 25),
                  alignment: Alignment.centerRight,
                  child: Text(
                      this.rightInfo,
                      overflow: TextOverflow.ellipsis,
                      style: this.contentStyle ?? new TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF333333),
                      )
                  ),
                ),
              ],
            ),
          ]),
        )
    );
  }
}
