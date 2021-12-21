import 'package:flutter/material.dart';

class btnContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 5),
        child: Ink(
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(6),
          //     color: Colors.white,
          //     border: Border.all(color: Colors.white, width: 10)),
          child: Column(children: <Widget>[
            Container(
                // width: MediaQuery.of(context).size.width,
                height: 90,
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Image.asset(
                  'images/setting_headBg.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.fitHeight,
                )),
            Container(
              // width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(
                '大宝',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    // fontFamily: 'wryh',
                    fontSize: 15),
              ),
            ),
            Row(children: <Widget>[
              Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width/2-55,
                  height: 30,
                  padding: EdgeInsets.only(top: 5,right: 0),
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'images/setting_headBg.png',
                    width: 12,
                    height: 12,
                    fit: BoxFit.fitHeight,
                  )),
              Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.center,
                child: Text(
                  '1岁3个月28天',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      // fontFamily: 'wryh',
                      fontSize: 12),
                ),
              ),
            ]),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.white, blurRadius: 15.0)],
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 10)),
              width: MediaQuery.of(context).size.width,
              height: 60,
              padding: EdgeInsets.only(top: 0, left: 15),
              child: Row(children: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    // padding: EdgeInsets.only(top: 0,right: 0),
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'images/setting_sleepIcon.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.fitHeight,
                    )
                ),
                Container(
                  padding: EdgeInsets.only(left: 0),
                  alignment: Alignment.center,
                  child: Text(
                    '1岁3个月28天',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                        // fontFamily: 'wryh',
                        fontSize: 12),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 30,
                    padding: EdgeInsets.only(top: 0,left: 10),
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'images/setting_redBgIcon.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.fitHeight,
                    )
                ),
              ]),
            ),
          ]),
        ));
  }
}
