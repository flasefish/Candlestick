import 'package:flutter/material.dart';

class SleepBottomItem extends StatelessWidget {
  const SleepBottomItem({
    Key key,
    @required this.topTitle,
    this.bottomLeftValue,
    this.bottomRightUnit,
    this.onTap,
    this.imageName,
  }): super(key: key);

  final GestureTapCallback onTap;
  final String topTitle;//顶部标题
  final String imageName;//左侧图片名字 不传则不显示图片
  final String bottomLeftValue;//底部左边数值
  final String bottomRightUnit;//底部右边单位

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
          margin: EdgeInsets.only(top: 0, left: 12, right: 12, bottom: 0),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: const Color(0xffe4e4e4), blurRadius: 15.0)],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 0)),
          child: Ink(
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 15, left: 10, right: 0, bottom: 0),
                    padding: EdgeInsets.only(left: 0),
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      '${this.imageName}',
                      width: 14,
                      height: 14,
                      fit: BoxFit.fitWidth,
                    )),
                Container(
                  // width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(top: 15,left: 1),
                  alignment: Alignment.topCenter,
                  child: Text(
                    this.topTitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        // fontFamily: 'wryh',
                        fontSize: 14),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5,left: 10),
                  alignment: Alignment.topCenter,
                  child: Text(
                    this.bottomLeftValue,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        // fontFamily: 'wryh',
                        fontSize: 28),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15,left: 1,bottom: 0),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    this.bottomRightUnit,
                    style: TextStyle(
                        color: Color(0xFF999999),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ]),
            ]),
          )
      ),
    );
  }
}
