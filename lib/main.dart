import 'package:candlestick/sleepreport.dart';
import 'package:flutter/material.dart';

import 'BasicDemo.dart';
import 'basic.dart';
import 'candlestick.dart';
import 'combined.dart';
import 'environmentpage.dart';
import 'healthypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'charts',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'charts'),
    routes: <String, WidgetBuilder>{
      'candlestick': (_) => OtherChartCandlestick(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选项'),
      ),
      body: ListView.builder(
        itemCount: demos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => demos[index].demo,
                  ),
                );
              },
              child: Text(demos[index].title),
            ),
          );
        },
      ),
    );
  }
}

final List<testListViewModal> demos = [
  testListViewModal(
    title: '柱子状态图',
    demo: OtherChartCandlestick(),
  ),
  testListViewModal(
    title: '柱状图2',
    demo: BasicDemo(title: 'Sliver - Grid和List混合使用'),
  ),
  testListViewModal(
    title: '健康数据',
    demo: HealthyPage(),
  ),
  testListViewModal(
    title: '环境数据',
    demo: EnvironmentPage(),
  ),

  testListViewModal(
    title: 'line char',
    demo: LineChartBasic(),
  ),

  testListViewModal(
    title: '组合',
    demo: OtherChartCombined(),
  ),

  testListViewModal(
    title: '睡眠报告',
    demo: SleepReportPage(),
  ),

];
class testListViewModal {
  final String title;
  final Widget demo;

  testListViewModal({this.title, this.demo});
}
