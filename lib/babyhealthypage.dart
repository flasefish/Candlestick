


import 'package:candlestick/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/candlestick_chart.dart';
import 'package:mp_chart/mp/controller/candlestick_chart_controller.dart';
import 'package:mp_chart/mp/core/data/candle_data.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_line_data_set.dart';
import 'package:mp_chart/mp/core/data_set/candle_data_set.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/candle_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/enums/mode.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/marker/bar_chart_marker.dart';
import 'package:mp_chart/mp/core/marker/i_marker.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/my_value_formatter.dart';

import 'candlestick.dart';
import 'environmentpage.dart';
import 'over_scroll_behavior.dart';

class BabyHealthyPage extends StatefulWidget {
  const BabyHealthyPage({Key key}) : super(key: key);

  @override
  State<BabyHealthyPage> createState() => _BabyHealthyPageState();
}


class _BabyHealthyPageState extends State<BabyHealthyPage> {
  CandlestickChartController controller;
  @override
  void initState() {
    _initController();
    _initCandleData(7);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    void _showcontent() {
      showDialog
        (barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    color: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                            height: 288,
                            width: 312,
                            child: CalendarPage(),
                          ),
                          SizedBox(height: 5,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("健康页面"),
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
            color: Colors.black,
            padding: EdgeInsets.only(right:20),
            icon: Icon(Icons.save),
            onPressed: ( ) { _showcontent();},
          ),
        ],
        elevation: 0,//隐藏底部阴影分割线
        backgroundColor: Colors.white,
      ),
      body:SingleChildScrollView(
        child:ScrollConfiguration(
          behavior: OverScrollBehavior(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Stack(
                 children: <Widget>[
                   Container(
                     margin: EdgeInsets.only(top:  0, left: 0, right: 0, bottom: 0),
                     padding: const EdgeInsets.only(top: 0.0, left: 0, right: 0, bottom: 0),
                     width: MediaQuery.of(context).size.width,
                     height: 90,
                     decoration: BoxDecoration(
                         boxShadow: [BoxShadow(color: const Color(0xffe4e4e4), blurRadius: 15.0)],
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                         border: Border.all(color: Colors.white, width: 0)
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Container(
                           width: MediaQuery.of(context).size.width/3.5,
                           height: 40,
                           padding: const EdgeInsets.only(
                               top: 15.0, left: 70, right: 0, bottom: 0),
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
                           height: 40,
                           padding: const EdgeInsets.only(
                               top: 15.0, left: 32, right: 32, bottom: 0),
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
                           height: 40,
                           padding: const EdgeInsets.only(
                               top: 15.0, left: 0, right: 70, bottom: 0),
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
                         padding: const EdgeInsets.only(top: 55, left: 70),
                         child: const Text(
                           '<',
                           style: TextStyle(color: Color(0xFF6C7077), fontSize: 20),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width/2,
                         padding: const EdgeInsets.only(top: 55, left: 0),
                         child: const Text(
                           '1212',
                           textAlign: TextAlign.center,
                           style: TextStyle(color: Color(0xFF6C7077), fontSize: 20),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width/5,
                         padding: const EdgeInsets.only(top: 55, left: 0),
                         child: const Text(
                           '>',
                           style: TextStyle(color: Color(0xFF6C7077), fontSize: 20),
                         ),
                       ),
                     ],
                   ),
                ]
               ),
                _buildReportHead(context,controller),
              ],
            ),

        ),
      ),
    );
  }

  Widget _buildReportHead(BuildContext context,CandlestickChartController controller) {
    return Container(
        height: MediaQuery.of(context).size.height / 7 * 6,
        margin: const EdgeInsets.only(left: 0, right: 0, top: 5),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 8, top: 10, bottom: 0, right: 3),
                    child: Image.asset('images/temperature.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 1, top: 2, bottom: 0, right: 100),
                    child: const Text(
                      '体温',
                      style: TextStyle(color: Color(0xFF969696), fontSize: 30),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 100, top: 10, bottom: 0, right: 3),
                    child: Image.asset('images/temperature_info.png'),
                  ),
                ],
              ),
              Container(
                  height: 150,
                child: CandlestickChart(controller)
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 8, top: 10, bottom: 0, right: 3),
                    child: Image.asset('images/temperature.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 1, top: 2, bottom: 0, right: 100),
                    child: const Text(
                      '呼吸',
                      style: TextStyle(color: Color(0xFF969696), fontSize: 30),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 100, top: 10, bottom: 0, right: 3),
                    child: Image.asset('images/temperature_info.png'),
                  ),
                ],
              ),
              Container(
                  height: 150,
                  child: CandlestickChart(controller)
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 8, top: 10, bottom: 0, right: 3),
                    child: Image.asset('images/temperature.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 1, top: 2, bottom: 0, right: 100),
                    child: const Text(
                      '心率',
                      style: TextStyle(color: Color(0xFF969696), fontSize: 30),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 100, top: 10, bottom: 0, right: 3),
                    child: Image.asset('images/temperature_info.png'),
                  ),
                ],
              ),
              Container(
                  height: 150,
                  child: CandlestickChart(controller)
              ),
            ],

          ),

        )

    );
  }

  void _initController() {
    var desc = Description()..enabled = false;
    controller = CandlestickChartController(
        axisLeftSettingFunction: (axisLeft, controller) {   //左边Y轴
          axisLeft
            ..setLabelCount2(6, true)
            ..setAxisMaximum(170.0)
            ..setAxisMinimum(70.0)
            ..setGranularity(20.0)
            ..drawGridLines = (false)  //Y轴的线条
            ..enableGridDashedLine(10, 10, 0) //Y轴虚线
            ..mDrawFilled=(true)
            ..setFilledTopY(38.0)
            ..setFilledBottomY(36.0)
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
            ..drawScale = (true)     //画刻度线
            ..drawScaleInterval = (1)
            ..drawLabels = (true)  //画标签 X轴上对应的数值
            ..textSize = 10  //字体大小
            ..setLabelCount3(7) //总共48个点
            ..setGranularity(1.toDouble())//设置缩放时轴的最小间隔。轴不允许往下走//*限制。这可以用于在缩放时避免标签重复。
            ..setValueFormatter(A(":00"))
            ..position = (XAxisPosition.BOTTOM);

        },
        marker: MyChartMarker(),
        drawGridBackground: false,
        backgroundColor: ColorUtils.WHITE,
        dragXEnabled: false,
        dragYEnabled: false,
        scaleXEnabled: false,
        scaleYEnabled: false,
        pinchZoomEnabled: false,
        drawMarkers:true,
        drawMarkerInRect:true,
        maxVisibleCount: 60,
        description: desc);
  }

  @override
  IMarker initMarker() => MyChartMarker();

  void _initCandleData(int count) async {
//    chart.resetTracking();

    var  datamax = [76.6,76.7,76.8,76.9,77.0,77.1,
      76.6,76.7,76.8,76.9,77.0,77.1,
      76.6,76.7,76.8,76.9,77.0,76.6,
      77.1,76.7,76.8,76.9,77.0,77.1,
      76.6,76.7,76.8,76.9,77.0,77.1,
      76.6,76.7,76.8,76.9,77.0,77.1,
      76.6,76.7,76.8,76.9,77.0,77.1,
      76.6,76.7,76.8,76.9,77.0,77.1];

    var datamin= [75.6,74.7,77.8,72.9,77.0,74.1,
      75.6,74.7,77.8,72.9,77.0,74.1,
      75.6,74.7,77.8,72.9,77.0,74.1,
      75.6,74.7,77.8,72.9,77.0,74.1,
      75.6,74.7,77.8,72.9,77.0,74.1,
      75.6,74.7,77.8,72.9,77.0,74.1,
      75.6,74.7,77.8,72.9,77.0,74.1,
      75.6,74.7,77.8,72.9,77.0,74.1];//图表的数据点

    List<CandleEntry> values = [];

    for (int i = 0; i < count; i++) {
      bool even = i % 2 == 0;
      bool hide = false;
      if(i == 1 || i == 3 || i == 9 )
        hide = true;
      Color entryHightColor;
      if(even)
        entryHightColor = Color(0xFFFF3B30);
      else
        entryHightColor = Color(0xFF007AFF);
      values.add(new CandleEntry(
          x:i.toDouble(),
          shadowH:even ? datamax[i] : datamax[i],
          shadowL:even ? datamin[i] : datamin[i],
          open:   even ? datamax[i] :datamin[i],
          close:  even ? datamin[i] : datamax[i],
          hide:hide,rectangle: false,data:"10/1",entryHighLightColor: true,entryHighLightColorValue:entryHightColor));
    }

    CandleDataSet set1 = CandleDataSet(values, "Data Set");

    set1.setDrawIcons(false);   //不绘制图标
    set1.setDrawValues(false);  //不显示文字
    set1.setAxisDependency(AxisDependency.LEFT); //
    set1.setBarSpace(0.7);      //设置柱的间隔0.3
    set1.setDecreasingColor(Color(0xFFFF3B30));  //open > close的颜色
    set1.setDecreasingPaintStyle(PaintingStyle.fill);  //阴影部分
    set1.setIncreasingColor(Color(0xFF007AFF));  //open <= close颜色
    set1.setIncreasingPaintStyle(PaintingStyle.fill);
    set1.setNeutralColor(Color(0xFF007AFF));  //open == close颜色
    set1.setHighLightColor(Color(0xFF007AFF)); //高亮颜色
    set1.setDrawHorizontalHighlightIndicator(false); //高亮的时候不画水平线


    controller.data = CandleData.fromList([]..add(set1));

    setState(() {});
  }

  void _initLineData(int count) async {
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
    set1.setLineWidth(2);  //画点的连接线的宽度
    set1.setCircleRadius(1);  //点的宽度
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
    set1.setHighLightColor(Color(0xFF007AFF)); //高亮颜色
    set1.setDrawHorizontalHighlightIndicator(false); //高亮的时候不画水平线
    List<ILineDataSet> dataSets = [];
    dataSets.add(set1); // add the data sets
    // create a data object with the data sets
    controller.data = LineData.fromList(dataSets);

    setState(() {});
  }

}