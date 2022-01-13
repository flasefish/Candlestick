import 'dart:math';

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
import '../action_state.dart';
import '../util.dart';

class OtherChartCombined extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtherChartCombinedState();
  }
}

class OtherChartCombinedState extends CombinedActionState<OtherChartCombined> {
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
  Widget getBody() {
    return Stack(
      children: <Widget>[
        Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: CombinedChart(controller)),
      ],
    );
  }

  void _initController() {
    var desc = Description()..enabled = false;
    controller = CombinedChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..drawGridLines = (false)
            ..setAxisMinimum(0);
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight
            ..drawGridLines = (false)
            ..setAxisMinimum(0);
        },
        legendSettingFunction: (legend, controller) {
          legend
            ..wordWrapEnabled = (true)
            ..verticalAlignment = (LegendVerticalAlignment.BOTTOM)
            ..horizontalAlignment = (LegendHorizontalAlignment.CENTER)
            ..orientation = (LegendOrientation.HORIZONTAL)
            ..drawInside = (false);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..position = (XAxisPosition.BOTH_SIDED)
            ..setAxisMinimum(0)
            ..setGranularity(1)
            ..setValueFormatter(A())
            ..setAxisMaximum(
                controller.data == null ? 0 : controller.data.xMax + 0.25);
        },
        drawGridBackground: false,
        drawBarShadow: false,
        highlightFullBarEnabled: false,
        dragXEnabled: true,
        dragYEnabled: true,
        scaleXEnabled: true,
        scaleYEnabled: true,
        pinchZoomEnabled: false,
        maxVisibleCount: 60,
        description: desc,
        drawOrder: List()
          ..add(DrawOrder.BAR)
          ..add(DrawOrder.BUBBLE)
          ..add(DrawOrder.CANDLE)
          ..add(DrawOrder.LINE)
          ..add(DrawOrder.SCATTER));
  }

  void _initCombinedData() {
    controller.data = CombinedData();
    controller.data
      ..setData1(generateLineData())
      ..setData2(generateBarData())
      ..setData5(generateBubbleData())
      ..setData3(generateScatterData())
      ..setData4(generateCandleData())
      ..setValueTypeface(Util.LIGHT);
  }

  double getRandom(double range, double start) {
    return (random.nextDouble() * range) + start;
  }

  LineData generateLineData() {
    LineData d = LineData();

    List<Entry> entries = List();

    for (int index = 0; index < _count; index++)
      entries.add(Entry(x: index + 0.5, y: getRandom(15, 5)));

    LineDataSet set = LineDataSet(entries, "Line DataSet");
    set.setColor1(Color.fromARGB(255, 240, 238, 70));
    set.setLineWidth(2.5);
    set.setCircleColor(Color.fromARGB(255, 240, 238, 70));
    set.setCircleRadius(5);
    set.setFillColor(Color.fromARGB(255, 240, 238, 70));
    set.setMode(Mode.CUBIC_BEZIER);
    set.setDrawValues(true);
    set.setValueTextSize(10);
    set.setValueTextColor(Color.fromARGB(255, 240, 238, 70));

    set.setAxisDependency(AxisDependency.LEFT);
    d.addDataSet(set);

    return d;
  }

  BarData generateBarData() {
    List<BarEntry> entries1 = List();
    List<BarEntry> entries2 = List();

    for (int index = 0; index < _count; index++) {
      entries1.add(BarEntry(x: 0, y: getRandom(25, 25)));

      // stacked
      entries2.add(BarEntry.fromListYVals(
          x: 0,
          vals: List<double>()
            ..add(getRandom(13, 12))
            ..add(getRandom(13, 12))));
    }

    BarDataSet set1 = BarDataSet(entries1, "Bar 1");
    set1.setColor1(Color.fromARGB(255, 60, 220, 78));
    set1.setValueTextColor(Color.fromARGB(255, 60, 220, 78));
    set1.setValueTextSize(10);
    set1.setAxisDependency(AxisDependency.LEFT);

    BarDataSet set2 = BarDataSet(entries2, "");
    set2.setStackLabels(List<String>()..add("Stack 1")..add("Stack 2"));
    set2.setColors1(List<Color>()
      ..add(Color.fromARGB(255, 61, 165, 255))
      ..add(Color.fromARGB(255, 23, 197, 255)));
    set2.setValueTextColor(Color.fromARGB(255, 61, 165, 255));
    set2.setValueTextSize(10);
    set2.setAxisDependency(AxisDependency.LEFT);

    double groupSpace = 0.06;
    double barSpace = 0.02; // x2 dataset
    double barWidth = 0.45; // x2 dataset
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
      entries.add(Entry(x: index + 0.25, y: getRandom(10, 55)));

    ScatterDataSet set = ScatterDataSet(entries, "Scatter DataSet");
    set.setColors1(ColorUtils.MATERIAL_COLORS);
    set.setScatterShapeSize(7.5);
    set.setDrawValues(false);
    set.setValueTextSize(10);
    d.addDataSet(set);

    return d;
  }

  CandleData generateCandleData() {
    CandleData d = CandleData();

    List<CandleEntry> entries = List();

    for (int index = 0; index < _count; index += 2)
      entries.add(CandleEntry(
          x: index + 1.0, shadowH: 90, shadowL: 70, open: 85, close: 75));

    CandleDataSet set = CandleDataSet(entries, "Candle DataSet");
    set.setDecreasingColor(Color.fromARGB(255, 142, 150, 175));
    set.setShadowColor(ColorUtils.DKGRAY);
    set.setBarSpace(0.3);
    set.setValueTextSize(10);
    set.setDrawValues(false);
    d.addDataSet(set);

    return d;
  }

  BubbleData generateBubbleData() {
    BubbleData bd = BubbleData();

    List<BubbleEntry> entries = List();

    for (int index = 0; index < _count; index++) {
      double y = getRandom(10, 105);
      double size = getRandom(100, 105);
      entries.add(BubbleEntry(x: index + 0.5, y: y, size: size));
    }

    BubbleDataSet set = BubbleDataSet(entries, "Bubble DataSet");
    set.setColors1(ColorUtils.VORDIPLOM_COLORS);
    set.setValueTextSize(10);
    set.setValueTextColor(ColorUtils.WHITE);
    set.setHighlightCircleWidth(1.5);
    set.setDrawValues(true);
    bd.addDataSet(set);

    return bd;
  }
}

final List<String> months = List()
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
    return months[value.toInt() % months.length];
  }
}
