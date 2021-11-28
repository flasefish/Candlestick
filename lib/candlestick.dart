import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mp_chart/mp/chart/candlestick_chart.dart';
import 'package:mp_chart/mp/controller/candlestick_chart_controller.dart';
import 'package:mp_chart/mp/core/axis/axis_base.dart';
import 'package:mp_chart/mp/core/axis/x_axis.dart';
import 'package:mp_chart/mp/core/data/candle_data.dart';
import 'package:mp_chart/mp/core/data_set/candle_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/candle_entry.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';
import 'package:mp_chart/mp/core/value_formatter/my_value_formatter.dart';
import 'action_state.dart';

class OtherChartCandlestick extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtherChartCandlestickState();
  }
}

class OtherChartCandlestickState
    extends CandlestickActionState<OtherChartCandlestick> {
  var random = Random(1);
  int _count = 48;
  double _range = 100.0;

  @override
  void initState() {
    _initController();
    _initCandleData(_count, _range);
    super.initState();
  }

  @override
  String getTitle() => "Other Chart Candlestick";

  @override
  Widget getBody() {
    return Stack(
      children: <Widget>[
        Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 450,
            child: CandlestickChart(controller)),
      ],
    );
  }

  void _initController() {
    var desc = Description()..enabled = false;
    controller = CandlestickChartController(
        axisLeftSettingFunction: (axisLeft, controller) {   //左边Y轴
          axisLeft
            ..setLabelCount2(6, false)
            ..setAxisMaximum(42.0)
            ..setAxisMinimum(32.0)
            ..setGranularity(2.0)
            ..drawGridLines = (true)  //Y轴的线条
            ..enableGridDashedLine(10, 10, 0) //Y轴虚线
            ..setValueFormatter(MyValueFormatter(""))
            ..drawAxisLine = (false);
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
        },
        legendSettingFunction: (legend, controller) {
          legend.enabled = (false);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..drawAxisLine = (false)  //不画X线
            ..drawGridLines = (false) //不画网格线
            ..drawLabels = (true)  //画标签 X轴上对应的数值
            ..textSize = 10  //字体大小
            ..setLabelCount1(48) //总共48个点
            ..setGranularity(1.toDouble())//设置缩放时轴的最小间隔。轴不允许往下走//*限制。这可以用于在缩放时避免标签重复。
            ..setValueFormatter(A(":00"))
            ..position = (XAxisPosition.BOTTOM);

        },
        drawGridBackground: false,
        backgroundColor: ColorUtils.WHITE,
        dragXEnabled: true,
        dragYEnabled: true,
        scaleXEnabled: true,
        scaleYEnabled: true,
        pinchZoomEnabled: true,
        maxVisibleCount: 60,
        description: desc);
  }

  void _initCandleData(int count, double range) async {
//    chart.resetTracking();

    var  datamax = [36.6,36.7,36.8,36.9,37.0,37.1,
                          36.6,36.7,36.8,36.9,37.0,37.1,
                          36.6,36.7,36.8,36.9,37.0,36.6,
                          37.1,36.7,36.8,36.9,37.0,37.1,
                          36.6,36.7,36.8,36.9,37.0,37.1,
                          36.6,36.7,36.8,36.9,37.0,37.1,
                          36.6,36.7,36.8,36.9,37.0,37.1,
                          36.6,36.7,36.8,36.9,37.0,37.1];

    var datamin= [35.6,34.7,33.8,32.9,33.0,34.1,
      35.6,34.7,33.8,32.9,33.0,34.1,
      35.6,34.7,33.8,32.9,33.0,34.1,
      35.6,34.7,33.8,32.9,33.0,34.1,
      35.6,34.7,33.8,32.9,33.0,34.1,
      35.6,34.7,33.8,32.9,33.0,34.1,
      35.6,34.7,33.8,32.9,33.0,34.1,
      35.6,34.7,33.8,32.9,33.0,34.1];//图表的数据点

    List<CandleEntry> values = [];

    for (int i = 0; i < count; i++) {
      bool even = i % 2 == 0;
      bool hide = false;
      if(i == 1 || i == 3 || i == 9 )
        hide = true;
      values.add(new CandleEntry(
          x:i.toDouble(),
          shadowH:even ? datamax[i] : datamax[i],
          shadowL:even ? datamin[i] : datamin[i],
          open:   even ? datamax[i] :datamin[i],
          close:  even ? datamin[i] : datamax[i],
          hide:hide,rectangle: false));
    /*  double multi = (range + 1);
      double val = (random.nextDouble() * 40) + multi;

      double high = (random.nextDouble() * 9) + 8;
      double low = (random.nextDouble() * 9) + 8;

      double open = (random.nextDouble() * 6) + 1;
      double close = (random.nextDouble() * 6) + 1;

      bool even = i % 2 == 0;

      values.add(CandleEntry(
          x: i.toDouble(),
          shadowH: val + high,
          shadowL: val - low,
          open: even ? val + open : val - open,
          close: even ? val - close : val + close));*/
    }

    CandleDataSet set1 = CandleDataSet(values, "Data Set");

    set1.setDrawIcons(false);   //不绘制图标
    set1.setDrawValues(false);  //不显示文字
    set1.setAxisDependency(AxisDependency.LEFT); //
    set1.setBarSpace(0.3);      //设置柱的间隔0.3
    set1.setDecreasingColor(Color(0xFFFF3B30));  //open > close的颜色
    set1.setDecreasingPaintStyle(PaintingStyle.fill);  //阴影部分
    set1.setIncreasingColor(Color(0xFF007AFF));  //open <= close颜色
    set1.setIncreasingPaintStyle(PaintingStyle.fill);
    set1.setNeutralColor(Color(0xFF007AFF));  //open == close颜色
    set1.setHighLightColor(Color(0xFF007AFF)); //高亮颜色
    set1.setDrawHorizontalHighlightIndicator(false); //高亮的时候不画水平线


//        set1.setColor(Color.rgb(80, 80, 80));
   // set1.setShadowColor(ColorUtils.DKGRAY);
    //set1.setDecreasingColor(ColorUtils.RED);
   // set1.setDecreasingPaintStyle(PaintingStyle.fill);
   // set1.setIncreasingColor(Color.fromARGB(255, 122, 242, 84));
   // set1.setIncreasingPaintStyle(PaintingStyle.stroke);
   // set1.setNeutralColor(ColorUtils.BLUE);

    //set1.setHighlightLineWidth(1f);

    controller.data = CandleData.fromList([]..add(set1));

    setState(() {});
  }
}


class A extends ValueFormatter {
  NumberFormat _format;
  String _suffix;

  A(String suffix) {
    _format = NumberFormat("###,###,###,##0");
    this._suffix = suffix;
  }
  @override
  String getFormattedValue1(double value) {
    return _format.format(value) + _suffix;
  }

  @override
  String getAxisLabel(double value, AxisBase axis) {
    if (axis is XAxis) {
      int x = (value/2).toInt();
      if(value.toInt() % 6 == 0){
        return _format.format(x) + _suffix;
      }else{
        return "";
      }
    } else if (value > 0) {
      return _format.format(value) + _suffix;
    } else {
      return _format.format(value);
    }
  }
}