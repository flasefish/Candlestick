

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

class SleepReportPage extends StatefulWidget {
  const SleepReportPage({Key key}) : super(key: key);

  @override
  State<SleepReportPage> createState() => _SleepReportPageState();
}

class _SleepReportPageState extends State<SleepReportPage> {
  CombinedChartController controller;

  int _count = 24;
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
      appBar: AppBar(
          title: Text('123')),
      body: Stack(
        children: <Widget>[
          Positioned(
              right: 0,
              left: 0,
              top: 50,
              bottom: 200,
              child: CombinedChart(controller)),
        ],
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
            ..drawGridLines = (false)
            ..drawAxisLine = (false)
            ..drawAxisLine = (false)
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
      ..setData4(generateCandleData())
      ..setValueTypeface(Util.LIGHT);

  }

  double getRandom(double range, double start) {
    return (random.nextDouble() * range) + start;
  }

  BarData generateBarData() {
    List<BarEntry> entries1 = [];
    List<BarEntry> entries2 = [];

    var sleepdata = [1,1,0,0,1,1,
                     1,0,0,1,1,0,
                     0,0,1,1,1,0,
                     0,1,1,0,1,0];

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

    BarDataSet set2 = BarDataSet(entries2, "");
    set2.setColor1(Color.fromARGB(255, 0x80, 0xba, 0xff));
    set2.setDrawValues(false);
    set2.setAxisDependency(AxisDependency.LEFT);
    set2.setHighlightEnabled(false); //高亮颜色

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
    var sleepdata = [1,1,0,0,1,1,
      1,0,0,1,1,0,
      0,0,1,1,1,0,
      0,1,1,0,1,0];

    var abnormaldata = [0,0,0,0,1,1,
                    0,0,1,1,0,0,
                    1,1,1,1,0,0,
                    0,0,1,1,0,0];
    var crydata = [0,0,0,0,1,0,
                   0,0,0,0,0,0,
                   1,0,0,0,1,0,
                   0,0,0,0,0,0];

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

    CandleDataSet set2 = CandleDataSet(entries2, "Candle DataSet1");
    set2.setDecreasingColor(Color.fromARGB(255, 0xAF,0x70,0xFF));
    set2.setShadowColor(Color.fromARGB(255, 0xAF,0x70,0xFF));
    set2.setBarSpace(0);
    set2.setDrawValues(false);
    set2.setAxisDependency(AxisDependency.LEFT);
    set2.setHighlightEnabled(false); //高亮颜色

    d.addDataSet(set);
    d.addDataSet(set2);

    return d;
  }
}

final List<String> hours =[]
  ..add("8:00")
  ..add("9:00")
  ..add("10:00")
  ..add("11:00")
  ..add("12:00")
  ..add("13:00")
  ..add("14:00")
  ..add("15:00")
  ..add("16:00")
  ..add("17:00")
  ..add("18:00")
  ..add("19:00")
  ..add("20:00")
  ..add("21:00")
  ..add("22:00")
  ..add("23:00")
  ..add("0:00")
  ..add("1:00")
  ..add("2:00")
  ..add("3:00")
  ..add("4:00")
  ..add("5:00")
  ..add("6:00")
  ..add("7:00");



class A extends ValueFormatter {
  @override
  String getFormattedValue1(double value) {
    return hours[value.toInt() % hours.length];
  }
}
