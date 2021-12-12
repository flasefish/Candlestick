

import 'package:flutter/material.dart';

import 'over_scroll_behavior.dart';

class BabyHealthyPage extends StatefulWidget {
  const BabyHealthyPage({Key key}) : super(key: key);

  @override
  State<BabyHealthyPage> createState() => _BabyHealthyPageState();
}


class _BabyHealthyPageState extends State<BabyHealthyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('健康数据'),
          actions: <Widget>[
              IconButton(icon:Icon(Icons.save), tooltip: '日期', onPressed: (){},),
            ]
      ),
      body:SingleChildScrollView(
        child:ScrollConfiguration(
          behavior: OverScrollBehavior(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width/3.5,
                          height: 35,
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 70, right: 0, bottom: 0),
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: const Color.fromARGB(255, 0x31, 0x72, 0xf0),
                              height: 30.0,
                              child: const Text(
                                '日',
                                style: TextStyle(fontSize: 16.0, color: Colors.black87),
                              ),
                              textColor: Colors.white,
                              onPressed: () {;
                              })),
                      Container(
                          width: MediaQuery.of(context).size.width/3.5,
                          height: 35,
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 32, right: 32, bottom: 0),
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              focusColor: const Color.fromARGB(255, 0, 188, 211),
                              height: 30.0,
                              child: const Text(
                                '周',
                                style: TextStyle(fontSize: 16.0, color: Colors.black87),
                              ),
                              textColor: Colors.white,
                              onPressed: () {;
                              })),
                      Container(
                          width: MediaQuery.of(context).size.width/3.5,
                          height: 35,
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 0, right: 70, bottom: 0),
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              focusColor: const Color.fromARGB(255, 0, 188, 211),
                              height: 30.0,
                              child: const Text(
                                '月',
                                style: TextStyle(fontSize: 16.0, color: Colors.black87),
                              ),
                              textColor: Colors.white,
                              onPressed: () {;
                              })),
                    ],
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/5,
                      padding: const EdgeInsets.only(top: 10, left: 70),
                      child: const Text(
                        '<',
                        style: TextStyle(color: Color(0xFF6C7077), fontSize: 20),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: const EdgeInsets.only(top: 10, left: 0),
                      child: const Text(
                        '1212',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF6C7077), fontSize: 20),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/5,
                      padding: const EdgeInsets.only(top: 10, left: 0),
                      child: const Text(
                        '>',
                        style: TextStyle(color: Color(0xFF6C7077), fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),

        ),
      ),
    );
  }

  Widget _buildDaySelect(BuildContext context) {

  }



}