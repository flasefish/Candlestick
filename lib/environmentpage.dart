

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/line_chart.dart';
import 'package:mp_chart/mp/controller/line_chart_controller.dart';
import 'package:mp_chart/mp/core/adapter_android_mp.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_line_data_set.dart';
import 'package:mp_chart/mp/core/data_provider/line_data_provider.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/enums/mode.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/fill_formatter/i_fill_formatter.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';

import 'candlestick.dart';

class EnvironmentPage extends StatefulWidget {
  const EnvironmentPage({Key key}) : super(key: key);

  @override
  State<EnvironmentPage> createState() => _EnvironmentPageState();
}

class _EnvironmentPageState extends State<EnvironmentPage> {
  LineChartController controller;
  var random = Random(1);
  int _count = 48;
  double _range = 100.0;

  @override
  void initState() {
    _initController();
    _initLineData(_count, _range);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.red);
    return Scaffold(
      appBar: AppBar(
          title: Text('123')),
      body: Stack(
        children: <Widget>[
          Positioned(
              right: 60,
              left: 60,
              top: 50,
            //  bottom: 800,
              height: 40,
              child: _initLineChart()),
       /*   Positioned(
              right: 0,
              left: 0,
              top: 200,
              bottom: 380,
              child: LineChart(controller)),
          Positioned(
              right: 0,
              left: 0,
              top: 400,
              bottom: 200,
              child: LineChart(controller)),*/
        ],
      ),
    );

  }

  void _initController() {
    var desc = Description()..enabled = false;

    controller = LineChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft.enabled = (false);
         //   ..setLabelCount2(6, false)
         //   ..setAxisMaximum(40.0)
         //   ..setAxisMinimum(0.0)
         //   ..setGranularity(8.0)
         //   ..drawGridLines = (false)  //Y????????????
          //  ..mDrawFilled=(true)
          //  ..setFilledTopY(26.0)
          //  ..setFilledBottomY(20.0)
           // ..drawAxisLine = (false);
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
        },
        legendSettingFunction: (legend, controller) {
          legend.enabled = (false);
        },
        xAxisSettingFunction: (xAxis, controller) {
            xAxis.enabled = (false);
            // ..drawAxisLine = (false)  //??????X???
            //..drawGridLines = (false) //???????????????
            //..drawScale = (true)
            //..drawScaleInterval = (3)
            //..drawLabels = (true)  //????????? X?????????????????????
            //..textSize = 10  //????????????
            //..setLabelCount1(48) //??????48??????
            //..setGranularity(1.toDouble())//?????????????????????????????????????????????????????????//*?????????????????????????????????????????????????????????
            //..setValueFormatter(A(":00"))
            //..position = (XAxisPosition.BOTTOM);
        },
        drawGridBackground: false,
        backgroundColor: ColorUtils.WHITE,
        dragXEnabled: false,
        dragYEnabled: false,
        scaleXEnabled: false,
        scaleYEnabled: false,
        pinchZoomEnabled: false,
        description: desc);
  }

  void _initLineData(int count, double range) async {
    List<Entry> values = [];


    var  data = [double.nan,double.nan,26.8,27.9,28.0,double.nan,
      30.6,29.7,double.nan,27.9,26.0,25.1,
      24.6,25.7,26.8,27.9,28.0,29.1,
      30.6,29.7,28.8,27.9,26.1,double.nan,
      24.6,25.7,26.8,27.9,28.0,29.1,
      30.6,29.7,28.8,27.9,26.0,25.1,
      24.6,25.7,26.8,15.9,12.0,29.1,
      30.6,29.7,28.8,27.9,26.0,15.1];

    for (int i = 0; i < data.length; i++) {
      values.add(Entry(x: i.toDouble(), y: data[i]));
    }

    LineDataSet set1;
    // create a dataset and give it a type
    set1 = LineDataSet(values, "DataSet 1");
    set1.setMode(Mode.CUBIC_BEZIER);
    set1.setCubicIntensity(0.2);
    set1.setDrawIcons(false);

    // draw dashed line
   // set1.enableDashedLine(10, 5, 0);
    // black lines and points
    set1.setColor1(Color(0xFF007AFF));
    set1.setCircleColor(Color(0xFF007AFF));
    set1.setHighLightColor(Color(0xFF007AFF));
    // line thickness and point size
    set1.setLineWidth(2);  //???????????????????????????
    set1.setCircleRadius(1);  //????????????
    // draw points as solid circles
    //set1.setDrawCircleHole(false);
    // customize legend entry
   // set1.setFormLineWidth(1);
   // set1.setFormLineDashEffect(DashPathEffect(10, 5, 0));
  //  set1.setFormSize(15);
    // text size of values
    set1.setDrawValues(false);
    //set1.setValueTextSize(9);
    // draw selection line as dashed
   // set1.enableDashedHighlightLine(10, 5, 0);
    // set the filled area
    set1.setDrawFilled(true);
    set1.setFillFormatter(myfill());
//    set1.setFillColor(color);
   // set1.setFillAlpha(alpha)
    // set color of filled area
    set1.setGradientColor(ColorUtils.BLUE, ColorUtils.RED);
    set1.setHighLightColor(Color(0xFF007AFF)); //????????????
    set1.setDrawHorizontalHighlightIndicator(false); //??????????????????????????????
    List<ILineDataSet> dataSets = [];
    dataSets.add(set1); // add the data sets
    // create a data object with the data sets
    controller.data = LineData.fromList(dataSets);

    setState(() {});
  }

  Widget _initLineChart() {
    var lineChart = LineChart(controller);
    controller.animator
      ..reset()
      ..animateX1(1500);
    return lineChart;
  }

}

class myfill implements IFillFormatter{
  @override
  double getFillLinePosition(
      ILineDataSet dataSet, LineDataProvider dataProvider){
    return dataProvider.getAxis(AxisDependency.LEFT).filledBottomY;
  }
}

