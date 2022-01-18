

import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/line_chart.dart';
import 'package:mp_chart/mp/controller/line_chart_controller.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_line_data_set.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/mode.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';

class BabyOriginPageSqit extends StatefulWidget{
  @override
  _babyOriginPageSqitState createState() => _babyOriginPageSqitState();
}

class _babyOriginPageSqitState extends State<BabyOriginPageSqit> {
  LineChartController controller;
  int currentIndex = 0;
  Duration duration = Duration(milliseconds: 1000);

  int _count = 45;
  double _range = 180.0;

  @override
  void initState() {
    _initController();
    _initLineData(_count, _range);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BoxDecoration boxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      // border: Border.all(color: BMColor.whiteFFFFFF, width: 4.w),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Titled Bottom Bar"),
      ),
      body: Container(
        width: 136,
        height: 240,
        decoration: boxDeco,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildItemWidget(),
            RaisedButton(
              child: Text('动画1'),
              onPressed: () {
                setState(() {
                  currentIndex = currentIndex == 0 ? 1 : 0;
                });
              },
            ),
            //  breathBox(),
            // heartBox(),
          ],
        ),
      ),
    );
  }

  /*Widget bodyTempBox() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
        ),

        _buildItemWidget(),
      ],
    );
  }*/

  Widget _buildItemWidget( ) {
    return Container(
      height: 80,
     // width: 100,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            top: 15,
            left: 24,
            child: Image.asset(
                'images/body_temp.png', width: 36, height: 38, fit: BoxFit.fill),
          ),
          Positioned(
            top: 10,
            right: 18,
            height: 20,
            child:
            Text('体温', style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),),
          ),
          AnimatedOpacity(
            opacity: currentIndex == 0 ? 1.0 : 0.0,
            duration: duration,
            curve: Curves.ease ,
            child:  bodyTempBox(),
          ),
          AnimatedAlign(
            duration: duration,
            alignment: currentIndex  ==  1 ? Alignment.center : Alignment(0, -2.2),
            child: bodyTempMax(),
          ),
        ],
      ),
    );
  }

  Widget bodyTempMax(){
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
        ),
        Positioned(
          top: 0,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('36.8', style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      ],);
  }

  Widget bodyTempBox() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 80,
        ),
        Positioned(
          top: 35,
          right: 18,
          child:
          Text('36.8', style: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        Positioned(
          top: 55,
          left: 0,
          right: 18,
          height: 50,
          //bottom: 500.w,
          child:_initLineChart(),
        )
      ],
    );
  }


  void _initController() {
    var desc = Description()..enabled = false;

    controller = LineChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft.enabled = (false); //不要X轴
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);  //不需要右侧X轴
        },
        legendSettingFunction: (legend, controller) {
          legend.enabled = (false); //不需要图例
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis.enabled = (false);  //不需要Y轴

        },
        drawGridBackground: true,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        //   backgroundColor: const Color.fromRGBO(255, 255, 255, 0.05),
        dragXEnabled: false,
        dragYEnabled: false,
        scaleXEnabled: false,
        scaleYEnabled: false,
        pinchZoomEnabled: false,
        description: desc);
  }

  void _initLineData(int count, double range) async {
    List<Entry> values = [];


    var  data = [30.6,27.9,26.8,27.9,28.0,28.2,
      30.6,29.7,24.6,27.9,26.0,25.1,
      24.6,25.7,26.8,27.9,28.0,29.1,
      30.6,29.7,28.8,27.9,26.1,24.6,
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
    //  set1.setFillFormatter(myfill());
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

    //  setState(() {});
  }

  Widget _initLineChart() {
    var lineChart = LineChart(controller);
    controller.animator
      ..reset()
      ..animateX1(1500);
    return lineChart;
  }
}
