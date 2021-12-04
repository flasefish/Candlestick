

import 'dart:math';

import 'package:candlestick/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/controller/bar_chart_controller.dart';
import 'package:mp_chart/mp/core/chart_trans_listener.dart';
import 'package:mp_chart/mp/core/color/gradient_color.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_bar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/legend_form.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/enums/y_axis_label_position.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/touch_listener.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/day_axis_value_formatter.dart';
import 'package:mp_chart/mp/core/value_formatter/my_value_formatter.dart';

class BarChartBasic extends StatefulWidget{
  const BarChartBasic({Key key}) : super(key: key);

  @override
  State<BarChartBasic> createState() => BarChartBasicState();
}

class BarChartBasicState extends State<BarChartBasic>
    implements OnChartValueSelectedListener{

  BarChartController controller;
  var random = Random(1);
  int _count = 12;
  double _range = 50.0;


  @override
  void initState() {
    _initController();
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
              child: BarChart(controller)),
        ],
      ),
    );
  }

  void _initController(){
    var desc = Description()..enabled = false;
     controller = BarChartController(
       chartTransListener: MyChartTransListener(),
       axisLeftSettingFunction: (axisLeft,controller){
         axisLeft
           ..setLabelCount2(8,false)
             ..typeface = Util.LIGHT
             ..setValueFormatter(MyValueFormatter("\$"))
             ..position =  YAxisLabelPosition.OUTSIDE_CHART
             ..spacePercentTop = 15
             ..setAxisMinimum(0);
       },
       axisRightSettingFunction: (axisRight,controller){
         axisRight
         ..drawGridLines = false
         ..typeface = Util.LIGHT
          ..setLabelCount2(8, false)
          ..setValueFormatter(MyValueFormatter("\$"))
          ..spacePercentTop = 15
          ..setAxisMinimum(0);
       },
       legendSettingFunction: (legend, controller) {
         legend
           ..verticalAlignment = LegendVerticalAlignment.BOTTOM
           ..orientation = LegendOrientation.HORIZONTAL
           ..drawInside = false
           ..shape = LegendForm.SQUARE
           ..formSize = 20
           ..textSize = 11
           ..textColor = ColorUtils.RED
           ..xEntrySpace = 4;
       },
       xAxisSettingFunction: (xAxis, controller) {
         xAxis
           ..typeface = Util.LIGHT
           ..position = XAxisPosition.BOTTOM
           ..drawGridLines = false
           ..setGranularity(1.0)
           ..setLabelCount1(7)
           ..setValueFormatter(DayAxisValueFormatter(controller));
       },
       selectionListener: this,
       drawBarShadow: false,
       drawValueAboveBar: true,
       drawGridBackground: false,
       dragXEnabled: true,
       dragYEnabled: true,
       scaleXEnabled: true,
       scaleYEnabled: true,
       pinchZoomEnabled: false,
       maxVisibleCount: 60,
       description: desc,
       touchEventListener: MyTouchEventListener());
  }


  void _initData(int count, double range) {
    double start = 1;

    List<BarEntry> values = [];
    for (int i = start.toInt(); i < start + count; i++) {
      double val = (random.nextDouble() * (range + 1));
      values.add(BarEntry(x: i.toDouble(), y: val));
    }

    BarDataSet set1;
    set1 = BarDataSet(values, "The year 2017");
    set1.setDrawIcons(false);

//            set1.setColors(ColorTemplate.MATERIAL_COLORS);

    /*int startColor = ContextCompat.getColor(this, android.R.color.holo_blue_dark);
            int endColor = ContextCompat.getColor(this, android.R.color.holo_blue_bright);
            set1.setGradientColor(startColor, endColor);*/

    Color startColor1 = ColorUtils.HOLO_ORANGE_LIGHT;
    Color startColor2 = ColorUtils.HOLO_BLUE_LIGHT;
    Color startColor3 = ColorUtils.HOLO_ORANGE_LIGHT;
    Color startColor4 = ColorUtils.HOLO_GREEN_LIGHT;
    Color startColor5 = ColorUtils.HOLO_RED_LIGHT;
    Color endColor1 = ColorUtils.HOLO_BLUE_DARK;
    Color endColor2 = ColorUtils.HOLO_PURPLE;
    Color endColor3 = ColorUtils.HOLO_GREEN_DARK;
    Color endColor4 = ColorUtils.HOLO_RED_DARK;
    Color endColor5 = ColorUtils.HOLO_ORANGE_DARK;

    List<GradientColor> gradientColors = [];
    gradientColors.add(GradientColor(startColor1, endColor1));
    gradientColors.add(GradientColor(startColor2, endColor2));
    gradientColors.add(GradientColor(startColor3, endColor3));
    gradientColors.add(GradientColor(startColor4, endColor4));
    gradientColors.add(GradientColor(startColor5, endColor5));

    set1.setGradientColors(gradientColors);

    List<IBarDataSet> dataSets = [];
    dataSets.add(set1);

    controller.data = BarData(dataSets);
    controller.data
      ..setValueTextSize(10)
      ..setValueTypeface(Util.LIGHT)
      ..barWidth = 0.9;
  }

  void _initBarData(int count, double range) async {
    _initData(count, range);
    setState(() {});
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

class MyChartTransListener with ChartTransListener {
  @override
  void scale(double scaleX, double scaleY, double x, double y) {
    print("scale scaleX: $scaleX, scaleY: $scaleY, x: $x, y: $y");
  }

  @override
  void translate(double dx, double dy) {
    print("translate dx: $dx, dy: $dy");
  }
}

class MyTouchEventListener with OnTouchEventListener {
  @override
  void onDoubleTapUp(double x, double y) {
    print("onDoubleTapUp x: $x, y: $y");
  }

  @override
  void onMoveEnd(double x, double y) {
    print("onMoveEnd x: $x, y: $y");
  }

  @override
  void onMoveStart(double x, double y) {
    print("onMoveStart x: $x, y: $y");
  }

  @override
  void onMoveUpdate(double x, double y) {
    print("onMoveUpdate x: $x, y: $y");
  }

  @override
  void onScaleEnd(double x, double y) {
    print("onScaleEnd x: $x, y: $y");
  }

  @override
  void onScaleStart(double x, double y) {
    print("onScaleStart x: $x, y: $y");
  }

  @override
  void onScaleUpdate(double x, double y) {
    print("onScaleUpdate x: $x, y: $y");
  }

  @override
  void onSingleTapUp(double x, double y) {
    print("onSingleTapUp x: $x, y: $y");
  }

  @override
  void onTapDown(double x, double y) {
    print("onTapDown x: $x, y: $y");
  }

  @override
  TouchValueType valueType() {
    return TouchValueType.SCREEN;
  }

  @override
  void onDragEnd(double x, double y) {
    print("onDragEnd x: $x, y: $y");
  }

  @override
  void onDragStart(double x, double y) {
    print("onDragStart x: $x, y: $y");
  }

  @override
  void onDragUpdate(double x, double y) {
    print("onDragUpdate x: $x, y: $y");
  }
}
