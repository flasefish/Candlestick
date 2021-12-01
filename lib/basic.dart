import 'dart:math';

import 'package:candlestick/util.dart';
import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/line_chart.dart';
import 'package:mp_chart/mp/controller/line_chart_controller.dart';
import 'package:mp_chart/mp/core/adapter_android_mp.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_line_data_set.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/legend_form.dart';
import 'package:mp_chart/mp/core/enums/limit_label_postion.dart';
import 'package:mp_chart/mp/core/image_loader.dart';
import 'package:mp_chart/mp/core/limit_line.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';

import 'action_state.dart';


class LineChartBasic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LineChartBasicState();
  }
}

class LineChartBasicState extends LineActionState<LineChartBasic> {
  var random = Random(1);
  int _count = 48;
  double _range = 180.0;

  @override
  void initState() {
    _initController();
    _initLineData(_count, _range);
    super.initState();
  }

  @override
  Widget getBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          left: 0,
          top: 50,
          bottom: 500,
          child: LineChart(controller),
        ),
      ],
    );
  }

  @override
  String getTitle() {
    return "Line Chart Basic";
  }

  void _initController() {
    var desc = Description()..enabled = false;

    controller = LineChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..enableGridDashedLine(10, 10, 0)
            ..enableAxisLineDashedLine(5, 5, 0)
            ..setAxisMaximum(40)
            ..setAxisMinimum(0);
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
        },
        legendSettingFunction: (legend, controller) {
          legend.enabled = (false);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..enableAxisLineDashedLine(5, 5, 0)
            ..enableGridDashedLine(10, 10, 0);
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


    var  data = [36.6,36.7,36.8,36.9,37.0,37.1,
      36.6,36.7,36.8,36.9,37.0,37.1,
      36.6,36.7,36.8,36.9,37.0,36.6,
      37.1,36.7,36.8,36.9,37.0,37.1,
      36.6,36.7,36.8,36.9,37.0,37.1,
      36.6,36.7,36.8,36.9,37.0,37.1,
      36.6,36.7,36.8,36.9,37.0,37.1,
      36.6,36.7,36.8,36.9,37.0,37.1];

    for (int i = 0; i < data.length; i++) {
      values.add(Entry(x: i.toDouble(), y: data[i]));
    }

    /*for (int i = 0; i < count; i++) {
      double val = (random.nextDouble() * range) - 30;
      values.add(Entry(x: i.toDouble(), y: val));
    }*/

    LineDataSet set1;

    // create a dataset and give it a type
    set1 = LineDataSet(values, "DataSet 1");

    set1.setDrawIcons(false);

    // draw dashed line
    set1.enableDashedLine(10, 5, 0);

    // black lines and points
    set1.setColor1(ColorUtils.BLACK);
    set1.setCircleColor(ColorUtils.BLACK);
    set1.setHighLightColor(ColorUtils.PURPLE);

    // line thickness and point size
    set1.setLineWidth(1);
    set1.setCircleRadius(3);

    // draw points as solid circles
    set1.setDrawCircleHole(false);

    // customize legend entry
    set1.setFormLineWidth(1);
    set1.setFormLineDashEffect(DashPathEffect(10, 5, 0));
    set1.setFormSize(15);

    // text size of values
    set1.setDrawValues(false);
    //set1.setValueTextSize(9);

    // draw selection line as dashed
    set1.enableDashedHighlightLine(10, 5, 0);

    // set the filled area
    set1.setDrawFilled(true);

    // set color of filled area
    set1.setGradientColor(ColorUtils.BLUE, ColorUtils.RED);

    List<ILineDataSet> dataSets = List();
    dataSets.add(set1); // add the data sets

    // create a data object with the data sets
    controller.data = LineData.fromList(dataSets);

    setState(() {});
  }

}
