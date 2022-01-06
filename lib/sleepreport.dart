

import 'dart:math';

import 'package:candlestick/util.dart';
import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/combined_chart.dart';
import 'package:mp_chart/mp/controller/combined_chart_controller.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data/bubble_data.dart';
import 'package:mp_chart/mp/core/data/candle_data.dart';
import 'package:mp_chart/mp/core/data/combined_data.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data/scatter_data.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/bubble_data_set.dart';
import 'package:mp_chart/mp/core/data_set/candle_data_set.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/data_set/scatter_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/entry/bubble_entry.dart';
import 'package:mp_chart/mp/core/entry/candle_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/enums/mode.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';
import 'package:mp_chart/mp/painter/combined_chart_painter.dart';
import 'SleepTopItem.dart';
import 'SleepBottomItem.dart';

class SleepReportPage extends StatefulWidget {
  const SleepReportPage({Key key}) : super(key: key);

  @override
  State<SleepReportPage> createState() => _SleepReportPageState();
}

class _SleepReportPageState extends State<SleepReportPage> {
  CombinedChartController controller;

  int _count = 288;
  var random = Random(1);

  @override
  void initState() {
    _initController();
    _initCombinedData();
    super.initState();
  }

  @override
  String getTitle() => "Other Chart Combined";


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.red);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("11月01日 睡眠报告"),
        titleTextStyle: TextStyle(
          color: Colors.black,//设置字体颜色
          fontSize: 16,//设置字体大小
        ),
        centerTitle: true,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // 关闭当前页面
          },
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right:20),
            icon: new Image.asset("images/sleep_calanderIcon.png"),
            onPressed: () {},
          ),
        ],
        elevation: 0,//隐藏底部阴影分割线
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(top:  0, left: 0, right: 0, bottom: 34),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0.0),
          child: Center(
            child:Column(children: <Widget>[
              SleepTopItem(
                  topTitle: "总时长",
                  bottomInfo: "睡眠",
                  rightInfo: "11小时20分钟",
                  imageName: 'images/sleep_sleepIcon.png',
              ),
              SleepTopItem(
                  topTitle: "次数",
                  bottomInfo: "醒了",
                  rightInfo: "6次",
                  imageName: 'images/sleep_weakIcon.png',
              ),
              Container(
                margin: EdgeInsets.only(top:  20, left: 0, right: 0, bottom: 0),
                height: 30,
                child:
                Row(children: <Widget>[
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 24, top: 0),
                    child: Text(
                      '睡眠分析',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:  0, left: 30, right: 0, bottom: 0),
                    color: Color(0xFFBBDAFF),
                    width: 20,
                    height: 15,
                    // padding: EdgeInsets.only(left: 60, top: 0),
                  ),
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 4, top: 0),
                    child: Text(
                      '醒着',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xFFC1C1C1),
                          fontSize: 10
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:  0, left: 10, right: 0, bottom: 0),
                    color: Color(0xFF80BAFF),
                    width: 20,
                    height: 15,
                    // padding: EdgeInsets.only(left: 60, top: 0),
                  ),
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 4, top: 0),
                    child: Text(
                      '睡着',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xFFC1C1C1),
                          fontSize: 10
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:  0, left: 10, right: 0, bottom: 0),
                    color: Color(0xFFAF70FF),
                    width: 20,
                    height: 15,
                    // padding: EdgeInsets.only(left: 60, top: 0),
                  ),
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 4, top: 0),
                    child: Text(
                      '啼哭',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xFFC1C1C1),
                          fontSize: 10
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:  0, left: 10, right: 0, bottom: 0),
                    color: Color(0xFFF56467),
                    width: 20,
                    height: 15,
                    // padding: EdgeInsets.only(left: 60, top: 0),
                  ),
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 4, top: 0),
                    child: Text(
                      '异常',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xFFC1C1C1),
                          fontSize: 10
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 0),
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'images/sleep_wenhaoTipIcon.png',
                      width: 14,
                      height: 14,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top:  0, left: 0, right: 0, bottom: 0),
                height: 200,
                child:
                CombinedChart(controller),
              ),
              Container(
                margin: EdgeInsets.only(top:  20, left: 20, right: 20, bottom: 0),
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: const Color(0xFFF5e9eb), blurRadius: 15.0)],
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF5e9eb),
                    border: Border.all(color: Color(0xFFF5e9eb), width: 0)),
                child:Column(children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top:  20, left: 12, right: 0, bottom: 0),
                        width: 6,
                        height: 6,
                        //padding: EdgeInsets.only(left: 10,top: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color(0xFFF56467),
                        border: Border.all(color: Color(0xFFF56467), width: 0)),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        '发热',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 2, top: 20),
                      child: Text(
                        '(最高38.5℃)',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.only(right: 0, top: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '累计4小时20分钟',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14
                        ),
                      ),
                    ),
                  ]),
                  Row(children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top:  25, left: 12, right: 0, bottom: 0),
                        width: 6,
                        height: 6,
                        //padding: EdgeInsets.only(left: 10,top: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xFFF56467),
                            border: Border.all(color: Color(0xFFF56467), width: 0))
                    ),
                    Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width/2-20-40,
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        '心率异常',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2-20,
                      padding: EdgeInsets.only(right: 0, top: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '累计20分钟',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14
                        ),
                      ),
                    ),
                  ]),
                  Row(children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top:  25, left: 12, right: 0, bottom: 0),
                        width: 6,
                        height: 6,
                        //padding: EdgeInsets.only(left: 10,top: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xFFF56467),
                            border: Border.all(color: Color(0xFFF56467), width: 0))
                    ),
                    Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width/2-20-40,
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        '心率异常',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2-20,
                      padding: EdgeInsets.only(right: 0, top: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '累计20分钟',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14
                        ),
                      ),
                    ),
                  ]),
                ]),
              ),
              Container(
                // color: Colors.red,
                padding: EdgeInsets.only(left: 20, top: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  '健康总结',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,right: 0,left: 0),
                height: 100,
                child: Row(children: <Widget>[
                  Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width/3,
                    height: 100,
                    padding: EdgeInsets.only(top: 0,right: 0,left: 0),
                    alignment: Alignment.center,
                    child: SleepBottomItem(
                      topTitle: '平均体温',
                      imageName: 'images/sleep_temperatureIcon.png',
                      bottomLeftValue: '38.5',
                      bottomRightUnit: '°c',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 90,
                    padding: EdgeInsets.only(top: 0,right: 0,left: 0),
                    alignment: Alignment.center,
                    child: SleepBottomItem(
                      topTitle: '平均呼吸',
                      imageName: 'images/sleep_humidityIcon.png',
                      bottomLeftValue: '44',
                      bottomRightUnit: '次/分',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 90,
                    padding: EdgeInsets.only(top: 0,right: 0,left: 0),
                    alignment: Alignment.center,
                    child: SleepBottomItem(
                      topTitle: '平均心率',
                      imageName: 'images/sleep_heatIcon.png',
                      bottomLeftValue: '128',
                      bottomRightUnit: '次/分',
                    ),
                  ),
                ]),
              ),
              Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '睡眠环境',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:  20, left: 10, right: 0, bottom: 0),
                  padding: EdgeInsets.only(left: 5, top: 0,right: 5),
                  alignment: Alignment.center,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffe0ebdc),
                      border: Border.all(color: Color(0xffe0ebdc), width: 0)),
                  child: Text(
                    '舒适',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xFF71B75A),
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.only(top: 10,right: 0,left: 0),
                height: 100,
                child: Row(children: <Widget>[
                  Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width/3,
                    height: 100,
                    padding: EdgeInsets.only(top: 0,right: 0,left: 0),
                    alignment: Alignment.center,
                    child: SleepBottomItem(
                      topTitle: '平均室温',
                      imageName: 'images/sleep_roomTemperatureIcon.png',
                      bottomLeftValue: '26',
                      bottomRightUnit: '°c',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 90,
                    padding: EdgeInsets.only(top: 0,right: 0,left: 0),
                    alignment: Alignment.center,
                    child: SleepBottomItem(
                      topTitle: '平均噪音',
                      imageName: 'images/sleep_noiseIcon.png',
                      bottomLeftValue: '21',
                      bottomRightUnit: '分贝',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 90,
                    padding: EdgeInsets.only(top: 0,right: 0,left: 0),
                    alignment: Alignment.center,
                    child: SleepBottomItem(
                      topTitle: '平均湿度',
                      imageName: 'images/sleep_breathIcon.png',
                      bottomLeftValue: '60',
                      bottomRightUnit: '%',
                    ),
                  ),
                ]),
              ),
            ]),
          )
        ),
      ),
    );
  }
  void _initController() {
    var desc = Description()..enabled = false;
    controller = CombinedChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..drawGridLines = (false)
            ..drawAxisLine = (false)
             ..drawLabels = (false)
            ..drawAxisLine = (false)
            ..setAxisMaxValue(100)
            ..setAxisMinimum(0);
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
        },
        legendSettingFunction: (legend, controller) {
          legend
            ..enabled=(false);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..position = (XAxisPosition.BOTTOM)
            ..drawGridLines = (true)
            ..drawAxisLine = (true)
            ..drawScale = (true)
            ..setLabelCount4(5,true)
            ..setAxisMinimum(0)
            ..setGranularity(1)
            ..setValueFormatter(A())
            ..setAxisMaximum(
                controller.data == null ? 0 : controller.data.xMax + 0.25);
        },
        drawGridBackground: false,
        drawBarShadow: false,
        highlightFullBarEnabled: false,
        dragXEnabled: false,
        dragYEnabled: false,
        scaleXEnabled: false,
        scaleYEnabled: false,
        pinchZoomEnabled: false,
        maxVisibleCount: 60,
        description: desc,
        drawOrder: []
          ..add(DrawOrder.BAR)
          ..add(DrawOrder.CANDLE)
          ..add(DrawOrder.SCATTER));
  }

  void _initCombinedData() {
    controller.data = CombinedData();
    controller.data
      ..setData2(generateBarData())
      ..setData3(generateScatterData())
      ..setData4(generateCandleData());
     // ..setValueTypeface(Util.LIGHT);

  }

  double getRandom(double range, double start) {
    return (random.nextDouble() * range) + start;
  }

  BarData generateBarData() {
    List<BarEntry> entries1 = [];
    List<BarEntry> entries2 = [];

    var sleepdata = [1,0,0,0,1,1, 1,0,0,0,1,1, 1,0,0,0,1,1, 1,0,0,0,1,1, 1,0,0,0,1,1, 1,0,0,0,1,1,
                     1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0,
      1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0,
      1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0,
      1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0,
      1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0,
      1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0,
      1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0, 1,0,0,1,1,0];

    for (int index = 0; index < _count; index++) {
      if (sleepdata[index] > 0) {
        entries1.add(BarEntry(x: index.toDouble(), y: 100));
        entries2.add(BarEntry(x: index.toDouble(), y: 100));
      } else {
        entries1.add(BarEntry(x: index.toDouble(), y: 0));
        entries2.add(BarEntry(x: index.toDouble(), y: 0));
      }
    }

    BarDataSet set1 = BarDataSet(entries1, "Bar 1");
    set1.setColor1(Color.fromARGB(255, 0x80, 0xba, 0xff));
    set1.setDrawValues(false);
    set1.setAxisDependency(AxisDependency.LEFT);
    set1.setHighlightEnabled(false); //高亮颜色
    set1.setFillXGrid(true);

    BarDataSet set2 = BarDataSet(entries2, "");
    set2.setColor1(Color.fromARGB(255, 0x80, 0xba, 0xff));
    set2.setDrawValues(false);
    set2.setAxisDependency(AxisDependency.LEFT);
    set2.setHighlightEnabled(false); //高亮颜色
    set2.setFillXGrid(true);

    double groupSpace = 0.00;
    double barSpace = 0.00; // x2 dataset
    double barWidth = 0.50; // x2 dataset
    // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"

    BarData d = BarData(List()..add(set1)..add(set2));
    d.barWidth = (barWidth);

    // make this BarData object grouped
    d.groupBars(0, groupSpace, barSpace); // start at x = 0

    return d;
  }

  ScatterData generateScatterData() {
    ScatterData d = ScatterData();

    List<Entry> entries = List();

    for (double index = 0; index < _count; index += 0.5)
      entries.add(Entry(x: index + 0.25, y: 50));

    ScatterDataSet set = ScatterDataSet(entries, "Scatter DataSet");
    set.setColors1(ColorUtils.MATERIAL_COLORS);
    set.setDrawValues(false);
    set.setVisible(false);
    set.setHighlightEnabled(false);
    d.addDataSet(set);

    return d;
  }

  CandleData generateCandleData() {
    CandleData d = CandleData();

    List<CandleEntry> entries1 = [];
    List<CandleEntry> entries2 = [];


    var abnormaldata = [1,1,0,0,1,1, 1,0,0,0,1,1, 1,1,0,0,1,1, 1,0,0,0,1,1, 1,1,0,0,1,1, 1,0,0,0,1,1,
      0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0,
      1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0,
      0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0,
      1,1,0,0,1,1, 1,0,0,0,1,1, 1,1,0,0,1,1, 1,0,0,0,1,1, 1,1,0,0,1,1, 1,0,0,0,1,1,
      0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0,
      1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0, 1,1,1,1,0,0,
      0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0, 0,0,1,1,0,0];
    var crydata = [1,0,0,0,1,0, 1,0,0,0,1,0,1,0,0,0,1,0, 1,0,0,0,1,0,1,0,0,0,1,0, 1,0,0,0,1,0,
                   0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,
                   1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0,
                   0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0,
                    1,0,0,0,1,0, 1,0,0,0,1,0,1,0,0,0,1,0, 1,0,0,0,1,0,1,0,0,0,1,0, 1,0,0,0,1,0,
                    0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,
                    1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0, 1,0,0,0,1,0,
                    0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0
                ];

    for (int index = 0; index < _count ;  index ++) {
      if(abnormaldata[index] > 0 ) {
        entries1.add(CandleEntry(
            x: index + 0.5,
            shadowH: 90,
            shadowL: 55,
            open: 90,
            close: 55));
      }else{
        entries1.add(CandleEntry(
            x: index + 0.5,
            shadowH: 0,
            shadowL: 0,
            open: 0,
            close: 0));
      }
      if(crydata[index] > 0){
        entries2.add(CandleEntry(
            x: index + 0.5,
            shadowH: 45,
            shadowL: 5,
            open: 45,
            close: 5));
      }else{
        entries2.add(CandleEntry(
            x: index + 0.5,
            shadowH: 0,
            shadowL: 0,
            open: 0,
            close: 0));
      }
    }
    CandleDataSet set = CandleDataSet(entries1, "Candle DataSet1");
    set.setDecreasingColor(Color.fromARGB(255, 0xf5, 0x64, 0x67));
    set.setShadowColor(Color.fromARGB(255, 0xf5, 0x64, 0x67));
    set.setBarSpace(0);
    set.setDrawValues(false);
    set.setAxisDependency(AxisDependency.LEFT);
    set.setHighlightEnabled(false); //
   // set.setFillXGridLine(true);

    CandleDataSet set2 = CandleDataSet(entries2, "Candle DataSet1");
    set2.setDecreasingColor(Color.fromARGB(255, 0xAF,0x70,0xFF));
    set2.setShadowColor(Color.fromARGB(255, 0xAF,0x70,0xFF));
    set2.setBarSpace(0);
    set2.setDrawValues(false);
    set2.setAxisDependency(AxisDependency.LEFT);
    set2.setHighlightEnabled(false); //高亮颜色
    set2.setFillXGridLine(true);

    d.addDataSet(set);
    d.addDataSet(set2);



    return d;
  }
}

final List<String> hours =[]
  ..add("8:00")
  ..add("8:05")
  ..add("8:10")
  ..add("8:15")
  ..add("8:20")
  ..add("8:25")
  ..add("8:30")
  ..add("8:35")
  ..add("8:40")
  ..add("8:45")
  ..add("8:50")
  ..add("8:55")
  ..add("11:00")
  ..add("11:05")
  ..add("11:10")
  ..add("11:15")
  ..add("11:20")
  ..add("11:25")
  ..add("11:30")
  ..add("11:35")
  ..add("11:40")
  ..add("11:45")
  ..add("11:50")
  ..add("11:55")
  ..add("10:00")
  ..add("10:05")
  ..add("10:10")
  ..add("10:15")
  ..add("10:20")
  ..add("10:25")
  ..add("10:30")
  ..add("10:35")
  ..add("10:40")
  ..add("10:45")
  ..add("10:50")
  ..add("10:55")
  ..add("11:00")
  ..add("11:05")
  ..add("11:10")
  ..add("11:15")
  ..add("11:20")
  ..add("11:25")
  ..add("11:30")
  ..add("11:35")
  ..add("11:40")
  ..add("11:45")
  ..add("11:50")
  ..add("11:55")
  ..add("12:00")
  ..add("12:05")
  ..add("12:10")
  ..add("12:15")
  ..add("12:20")
  ..add("12:25")
  ..add("12:30")
  ..add("12:35")
  ..add("12:40")
  ..add("12:45")
  ..add("12:50")
  ..add("12:55")
  ..add("13:00")
  ..add("13:05")
  ..add("13:10")
  ..add("13:15")
  ..add("13:20")
  ..add("13:25")
  ..add("13:30")
  ..add("13:35")
  ..add("13:40")
  ..add("13:45")
  ..add("13:50")
  ..add("13:55")
  ..add("14:00")
  ..add("14:05")
  ..add("14:10")
  ..add("14:15")
  ..add("14:20")
  ..add("14:25")
  ..add("14:30")
  ..add("14:35")
  ..add("14:40")
  ..add("14:45")
  ..add("14:50")
  ..add("14:55")
  ..add("15:00")
  ..add("15:05")
  ..add("15:10")
  ..add("15:15")
  ..add("15:20")
  ..add("15:25")
  ..add("15:30")
  ..add("15:35")
  ..add("15:40")
  ..add("15:45")
  ..add("15:50")
  ..add("15:55")
  ..add("16:00")
  ..add("16:05")
  ..add("16:10")
  ..add("16:15")
  ..add("16:20")
  ..add("16:25")
  ..add("16:30")
  ..add("16:35")
  ..add("16:40")
  ..add("16:45")
  ..add("16:50")
  ..add("16:55")
  ..add("17:00")
  ..add("17:05")
  ..add("17:10")
  ..add("17:15")
  ..add("17:20")
  ..add("17:25")
  ..add("17:30")
  ..add("17:35")
  ..add("17:40")
  ..add("17:45")
  ..add("17:50")
  ..add("17:55")
  ..add("18:00")
  ..add("18:05")
  ..add("18:10")
  ..add("18:15")
  ..add("18:20")
  ..add("18:25")
  ..add("18:30")
  ..add("18:35")
  ..add("18:40")
  ..add("18:45")
  ..add("18:50")
  ..add("18:55")
  ..add("19:00")
  ..add("19:05")
  ..add("19:10")
  ..add("19:15")
  ..add("19:20")
  ..add("19:25")
  ..add("19:30")
  ..add("19:35")
  ..add("19:40")
  ..add("19:45")
  ..add("19:50")
  ..add("19:55")
  ..add("20:00")
  ..add("20:05")
  ..add("20:10")
  ..add("20:15")
  ..add("20:20")
  ..add("20:25")
  ..add("20:30")
  ..add("20:35")
  ..add("20:40")
  ..add("20:45")
  ..add("20:50")
  ..add("20:55")
  ..add("21:00")
  ..add("21:05")
  ..add("21:10")
  ..add("21:15")
  ..add("21:20")
  ..add("21:25")
  ..add("21:30")
  ..add("21:35")
  ..add("21:40")
  ..add("21:45")
  ..add("21:50")
  ..add("21:55")
  ..add("22:00")
  ..add("22:05")
  ..add("22:10")
  ..add("22:15")
  ..add("22:20")
  ..add("22:25")
  ..add("22:30")
  ..add("22:35")
  ..add("22:40")
  ..add("22:45")
  ..add("22:50")
  ..add("22:55")
  ..add("23:00")
  ..add("23:05")
  ..add("23:10")
  ..add("23:15")
  ..add("23:20")
  ..add("23:25")
  ..add("23:30")
  ..add("23:35")
  ..add("23:40")
  ..add("23:45")
  ..add("23:50")
  ..add("23:55")
  ..add("0:00")
  ..add("0:05")
  ..add("0:10")
  ..add("0:15")
  ..add("0:20")
  ..add("0:25")
  ..add("0:30")
  ..add("0:35")
  ..add("0:40")
  ..add("0:45")
  ..add("0:50")
  ..add("0:55")
  ..add("1:00")
  ..add("1:05")
  ..add("1:10")
  ..add("1:15")
  ..add("1:20")
  ..add("1:25")
  ..add("1:30")
  ..add("1:35")
  ..add("1:40")
  ..add("1:45")
  ..add("1:50")
  ..add("1:55")
  ..add("2:00")
  ..add("2:05")
  ..add("2:10")
  ..add("2:15")
  ..add("2:20")
  ..add("2:25")
  ..add("2:30")
  ..add("2:35")
  ..add("2:40")
  ..add("2:45")
  ..add("2:50")
  ..add("2:55")
  ..add("3:00")
  ..add("3:05")
  ..add("3:10")
  ..add("3:15")
  ..add("3:20")
  ..add("3:25")
  ..add("3:30")
  ..add("3:35")
  ..add("3:40")
  ..add("3:45")
  ..add("3:50")
  ..add("3:55")
  ..add("4:00")
  ..add("4:05")
  ..add("4:10")
  ..add("4:15")
  ..add("4:20")
  ..add("4:25")
  ..add("4:30")
  ..add("4:35")
  ..add("4:40")
  ..add("4:45")
  ..add("4:50")
  ..add("4:55")
  ..add("5:00")
  ..add("5:05")
  ..add("5:10")
  ..add("5:15")
  ..add("5:20")
  ..add("5:25")
  ..add("5:30")
  ..add("5:35")
  ..add("5:40")
  ..add("5:45")
  ..add("5:50")
  ..add("5:55")
  ..add("6:00")
  ..add("6:05")
  ..add("6:10")
  ..add("6:15")
  ..add("6:20")
  ..add("6:25")
  ..add("6:30")
  ..add("6:35")
  ..add("6:40")
  ..add("6:45")
  ..add("6:50")
  ..add("6:55")
  ..add("7:00")
  ..add("7:05")
  ..add("7:10")
  ..add("7:15")
  ..add("7:20")
  ..add("7:25")
  ..add("7:30")
  ..add("7:35")
  ..add("7:40")
  ..add("7:45")
  ..add("7:50")
  ..add("7:55");



class A extends ValueFormatter {
  @override
  String getFormattedValue1(double value) {
    return hours[value.toInt() % hours.length];
  }
}
