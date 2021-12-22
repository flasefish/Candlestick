import 'package:flutter/material.dart';

class BtbItemView extends StatelessWidget {
  const BtbItemView({
    Key key,
    @required this.title,
    this.onTap,
    this.imageName,
  }): super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String imageName;//左侧图片名字 不传则不显示图片

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 5),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: const Color(0xffe4e4e4), blurRadius: 15.0)],
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            border: Border.all(color: Colors.white, width: 0)),
        child: Ink(
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                // color: Colors.blue,
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  '${this.imageName}',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fitWidth,
                )),
            Container(
              // width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 0,left: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                this.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    // fontFamily: 'wryh',
                    fontSize: 15),
              ),
            ),
          ]),
        ));
  }
}
