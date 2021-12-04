

import 'dart:math';

import 'package:candlestick/util.dart';
import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/controller/bar_chart_controller.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/value_formatter/large_value_formatter.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';

class MultipleBarChartBasic extends StatefulWidget{
  const MultipleBarChartBasic({Key key}) : super(key: key);

  @override
  State<MultipleBarChartBasic> createState() => MultipleBarChartBasicState();
}

class MultipleBarChartBasicState extends State<MultipleBarChartBasic>
       implements OnChartValueSelectedListener{
  BarChartController controller;

  var random = Random(1);
  int _count = 10;
  double _range = 100.0;

  int groupCount;
  int startYear;
  int endYear;
  bool isDataInitial = false;

  @override
  void initState() {
    _iniController();
    _initBarData(_count, _range);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Bar Char Basic')),
      body: Stack(
        children: <Widget>[
          Positioned(
              right: 0,
              left: 0,
              top: 50,
              bottom: 300,
              child:BarChart(controller))
        ],
      ),
    );
  }

  void _iniController(){
    var desc = Description()..enabled = false;
    double groupSpace = 0.00;
    double barSpace = 0.00;
    controller = BarChartController(
      axisLeftSettingFunction: (axisLeft,controller){
          ValueFormatter formatter = LargeValueFormatter();
          axisLeft
            ..typeface = Util.LIGHT
            ..setValueFormatter(formatter)
            ..drawGridLines = (false)
            ..spacePercentTop = (35)
            ..setAxisMinimum(0);
      },
      axisRightSettingFunction: (axisRight,controller){
        axisRight.enabled = (false);
      },
      legendSettingFunction: (legend, controller) {
        legend
          ..verticalAlignment = (LegendVerticalAlignment.TOP)
          ..horizontalAlignment = (LegendHorizontalAlignment.RIGHT)
          ..orientation = (LegendOrientation.VERTICAL)
          ..drawInside = true
          ..typeface = Util.LIGHT
          ..yOffset = (0.0)
          ..xOffset = (10)
          ..yEntrySpace = (0)
          ..textSize = (8);
      },
      xAxisSettingFunction: (xAxis, controller) {
        xAxis
          ..typeface = Util.LIGHT
          ..setGranularity(1.0)
          ..centerAxisLabels = true
          ..setAxisMinimum(startYear.toDouble())
          ..setAxisMaximum(startYear +
              (controller.data as BarData)
                  .getGroupWidth(groupSpace, barSpace) *
                  groupCount)
          ..setValueFormatter(A());
        // (0.2 + 0.03) * 4 + 0.08 = 1.00 -> interval per "group"
        //  // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
        //        (0.30)     * 3 + 0.10 = 1
        (controller as BarChartController)
            .groupBars(startYear.toDouble(), groupSpace, barSpace);
      },
      drawGridBackground: false,
      dragXEnabled: true,
      dragYEnabled: true,
      scaleXEnabled: true,
      scaleYEnabled: true,
      pinchZoomEnabled: false,
      maxVisibleCount: 60,
      selectionListener: this,
      drawBarShadow: false,
      description: desc);
  }

  void _initBarData(int count,double range) async {
    groupCount = count + 1;
    startYear = 1980;
    endYear = startYear +groupCount;

    List<BarEntry> values1 = [];
    List<BarEntry> values2 = [];

    double randomMultiplier = range * 100000;

    List<double>  datax = [0,0,0,0,0,0,0,0,0,0,0,0];
    List<double>  datay = [80.46,80.46,80.46,90.0,80.46,80.46,0,80.46,80.46,80.46,80.46,80.46,80.46,80.46,80.46,80.46];

    int x = 0;
    for (int i = startYear; i < endYear; i++) {
      values1.add(BarEntry(
          x: i.toDouble(),
          y: datay[x]));
      values2.add(BarEntry(
          x: i.toDouble(),
          y: datay[x]));
      x++;
    }

    BarDataSet set1, set2, set3, set4;

    set1 = BarDataSet(values1, "Company A");
    set1.setColor1(Color.fromARGB(255, 0x80, 0xba, 0xff));
    set1.setDrawValues(false);
    set2 = BarDataSet(values2, "Company B");
    set2.setDrawValues(false);
    set2.setColor1(Color.fromARGB(255, 0x80, 0xba, 0xff));
    controller.data =
        BarData([]..add(set1)..add(set2));
    controller.data
      ..setValueFormatter(LargeValueFormatter())
      ..setValueTypeface(Util.LIGHT)
    // specify the width each bar should have
      ..barWidth = (0.5);

    setState(() {
      isDataInitial = true;
    });
  }
  @override
  void onNothingSelected() {
    // TODO: implement onNothingSelected
  }

  @override
  void onValueSelected(Entry e, Highlight h) {
    // TODO: implement onValueSelected
  }

}

class A extends ValueFormatter {
  @override
  String getFormattedValue1(double value) {
    return value.toInt().toString();
  }
}