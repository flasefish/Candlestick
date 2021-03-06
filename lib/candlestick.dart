import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mp_chart/mp/chart/candlestick_chart.dart';
import 'package:mp_chart/mp/controller/candlestick_chart_controller.dart';
import 'package:mp_chart/mp/core/axis/axis_base.dart';
import 'package:mp_chart/mp/core/axis/x_axis.dart';
import 'package:mp_chart/mp/core/data/candle_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_line_data_set.dart';
import 'package:mp_chart/mp/core/data_provider/line_data_provider.dart';
import 'package:mp_chart/mp/core/data_set/candle_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/candle_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/fill_formatter/i_fill_formatter.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/marker/bar_chart_marker.dart';
import 'package:mp_chart/mp/core/marker/i_marker.dart';
import 'package:mp_chart/mp/core/poolable/point.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/utils/painter_utils.dart';
import 'package:mp_chart/mp/core/utils/utils.dart';
import 'package:mp_chart/mp/core/value_formatter/default_value_formatter.dart';
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
            bottom: 550,
            child: CandlestickChart(controller)),
        Positioned(
            right: 0,
            left: 0,
            top: 200,
            bottom: 380,
            child: CandlestickChart(controller)),
      ],
    );
  }


  void _initController() {
    var desc = Description()..enabled = false;
    controller = CandlestickChartController(
        axisLeftSettingFunction: (axisLeft, controller) {   //??????Y???
          axisLeft
            ..setLabelCount2(6, false)
            ..setAxisMaximum(42.0)
            ..setAxisMinimum(32.0)
            ..setGranularity(2.0)
            ..drawGridLines = (true)  //Y????????????
            ..enableGridDashedLine(10, 10, 0) //Y?????????
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
            ..drawAxisLine = (false)  //??????X???
            ..drawGridLines = (false) //???????????????
            ..drawScale = (true)
            ..drawLabels = (true)  //????????? X?????????????????????
            ..textSize = 10  //????????????
            ..setLabelCount1(48) //??????48??????
            ..setGranularity(1.toDouble())//?????????????????????????????????????????????????????????//*?????????????????????????????????????????????????????????
            ..setValueFormatter(B(":00"))
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
        maxVisibleCount: 60,
        description: desc);
  }

  @override
  IMarker initMarker() => MyChartMarker();

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
      35.6,34.7,33.8,32.9,33.0,34.1];//??????????????????

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
          hide:hide,rectangle: false,entryHighLightColor: true));
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

    set1.setDrawIcons(false);   //???????????????
    set1.setDrawValues(false);  //???????????????
    set1.setAxisDependency(AxisDependency.LEFT); //
    set1.setBarSpace(0.27);      //??????????????????0.3
    set1.setDecreasingColor(Color(0xFFFF3B30));  //open > close?????????
    set1.setDecreasingPaintStyle(PaintingStyle.fill);  //????????????
    set1.setIncreasingColor(Color(0xFF007AFF));  //open <= close??????
    set1.setIncreasingPaintStyle(PaintingStyle.fill);
    set1.setNeutralColor(Color(0xFF007AFF));  //open == close??????
    set1.setHighLightColor(Color(0xFF007AFF)); //????????????
    set1.setDrawHorizontalHighlightIndicator(false); //??????????????????????????????


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

class B extends ValueFormatter {
  NumberFormat _format;
  String _suffix;

  B(String suffix) {
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
        return _format.format(x) + _suffix;
    } else if (value > 0) {
      return _format.format(value) + _suffix;
    } else {
      return _format.format(value);
    }
  }
}

class MyChartMarker implements IMarker {
  Entry _entry;
  // ignore: unused_field
  Highlight _highlight;
  double _dx = 0.0;
  double _dy = 0.0;

  DefaultValueFormatter _formatter;
  Color _textColor;
  Color _backColor;
  double _fontSize1;
  double _fontSize2;
  double _fontSize3;


  MyChartMarker({ Color textColor, Color backColor, double fontSize1,double fontSize2,double fontSize3})
      : _textColor = textColor,
        _backColor = backColor,
        _fontSize1 = fontSize1,
        _fontSize2 = fontSize2,
        _fontSize3 = fontSize3{
    _formatter = DefaultValueFormatter(0);
    this._textColor ??= ColorUtils.BLACK;
    this._backColor ??= ColorUtils.WHITE;
    this._fontSize1 ??= Utils.convertDpToPixel(12);
    this._fontSize2 ??= Utils.convertDpToPixel(15);
    this._fontSize3 ??= Utils.convertDpToPixel(12);
  }


  @override
  void draw(Canvas canvas, double posX, double posY) {
    if(_entry is CandleEntry) {
      double openvalue = (_entry as CandleEntry).open;
      double closevalue = (_entry as CandleEntry).close;
      int index = _entry.x.toInt();
      String timeStrin = "";
      if(index % 2 == 0) {
        timeStrin = (index/2).truncate().toString() + ":00" + "~"  +  (index/2).truncate().toString() + ":30";
      }else{
        timeStrin = (index/2).truncate().toString() + ":30" + "~"  +  ((index + 1)/2).truncate().toString() + ":00";
      }

      TextPainter painter = PainterUtils.create(
          null,
          "$timeStrin",
          _textColor,
          _fontSize1);
      print("---------------------------");



      print("posx = $posX.posy = $posY");
      TextPainter painter1 = PainterUtils.create(
          null,
          "${_formatter.getFormattedValue1(openvalue)}-${_formatter
              .getFormattedValue1(closevalue)}",
          _textColor,
          _fontSize2);

      TextPainter painter2 = PainterUtils.create(
          null,
          "??C",
          _textColor,
          _fontSize3);

      Paint paint = Paint()
        ..color = _backColor
        ..strokeWidth = 2
        ..isAntiAlias = true
        ..style = PaintingStyle.fill;

      MPPointF offset = getOffsetForDrawingAtPoint(posX, posY);
      print("offset = ${offset.x} ,${offset.y}");

      canvas.save();
      // translate to the correct position and draw
//    canvas.translate(posX + offset.x, posY + offset.y);
      painter.layout();
      painter1.layout();
      painter2.layout();
      Offset pos1 = calculatePos1(posX + offset.x, posY + offset.y, painter1.width, painter1.height); //???????????????
      print("pos1 = $pos1");

      Offset pos = calculatePos2(
          posX + offset.x, posY + offset.y, painter1.width, painter.height + painter1.height * 1.3); //1.3??????????????????
      print("pos = $pos");

      print("painter1 = ${painter1.width},${painter1.height}");
      Offset pos2 = calculatePos3(pos1.dx + painter1.width * 1.05, posY + offset.y, painter2.width/3, painter2.height * 0.8);
      print("pos2 = $pos2");


      canvas.drawRRect(
          RRect.fromLTRBR(pos1.dx - 10, pos.dy - 8, pos.dx + painter1.width + painter2.width + 8,
              pos.dy + painter.height + painter1.height + 8, Radius.circular(10)),
          paint);
      painter.paint(canvas, pos);
      painter1.paint(canvas, pos1);
      painter2.paint(canvas,pos2);
      //????????????????????????

      Paint _paint = new Paint();
      _paint.strokeWidth = 2.0;
      _paint.color = _backColor;
      _paint.style = PaintingStyle.fill;

      bool isDown = true;
      Path path = new Path();
      if (isDown) {
        path.moveTo(posX - 10, 20.0);
        path.lineTo(posX + 10, 20.0);
        path.lineTo(posX, 35);
      } else {
        path.moveTo(painter1.width / 2.0, 0.0);
        path.lineTo(0.0, painter1.height + 1);
        path.lineTo(painter1.width, painter1.height + 1);
      }

      canvas.drawPath(path, _paint);

      canvas.restore();
    }
  }

  Offset calculatePos1(double posX, double posY, double textW, double textH) {
    double newX = posX - textW /2;
    if(newX < 0){
      newX = 0;
    }
    return Offset(newX, -textH/2);
  }

  Offset calculatePos2(double posX, double posY, double textW, double textH) {
    double newX = posX - textW /2;
    if(newX < 0){
      newX = 0;
    }
    return Offset(newX, -textH/2);
  }

  Offset calculatePos3(double posX, double posY, double textW, double textH) {
    double newX = posX - textW /2;
    if(newX < 0){
      newX = 0;
    }
    return Offset(newX, -textH/2);
  }

  @override
  MPPointF getOffset() {
    return MPPointF.getInstance1(_dx, _dy);
  }

  @override
  MPPointF getOffsetForDrawingAtPoint(double posX, double posY) {
    return getOffset();
  }

  @override
  void refreshContent(Entry e, Highlight highlight) {
    _entry = e;
    highlight = highlight;
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  MPPointF getBoundaryOverflow(double posX,MPPointF curOffset,Rect rectRange,double maxlen) {
    if(  posX + curOffset.x  - maxlen/2 < 20)  // ??????2???10?????????
      curOffset.x = 20;
    if(  posX + curOffset.x + maxlen /2 > rectRange.right){
   //   curOffset.x =  (rectRange.right - maxlen / 2) - rectRange.right ;
      curOffset.x =  (rectRange.right - maxlen / 2) - posX ;
    }
    return curOffset;
  }


  @override
  void drawInRect(Canvas canvas, double posX, double posY, Rect rect) {
    // TODO: implement drawInRect
    print("rect = $rect");
    if(_entry is CandleEntry) {
      double openvalue = (_entry as CandleEntry).open;
      double closevalue = (_entry as CandleEntry).close;
      int index = _entry.x.toInt();
      String timeStrin = "";
      if(index % 2 == 0) {
        timeStrin = (index/2).truncate().toString() + ":00" + "~"  +  (index/2).truncate().toString() + ":30";
      }else{
        timeStrin = (index/2).truncate().toString() + ":30" + "~"  +  ((index + 1)/2).truncate().toString() + ":00";
      }
      print("---------------------------");
      print("datat = ${_entry.mData}");
      print("posx = $posX.posy = $posY");
      TextPainter painter1 = PainterUtils.create(
          null,
          "$timeStrin",
          _textColor,
          _fontSize1);

      TextPainter painter2 = PainterUtils.create(
          null,
          "${_formatter.getFormattedValue1(openvalue)}-${_formatter
              .getFormattedValue1(closevalue)}",
          _textColor,
          _fontSize2,
      fontWeight: FontWeight.bold);

      TextPainter painter3 = PainterUtils.create(
          null,
          "??C",
          _textColor,
          _fontSize3);

      Paint paint = Paint()
        ..color = _backColor
        ..strokeWidth = 2
        ..isAntiAlias = true
        ..style = PaintingStyle.fill;

      MPPointF offset = getOffsetForDrawingAtPoint(posX, posY);
      print("offset = ${offset.x} ,${offset.y}");



      canvas.save();
      // translate to the correct position and draw
//    canvas.translate(posX + offset.x, posY + offset.y);
      painter1.layout();
      painter2.layout();
      painter3.layout();
      print("painter1 = ${painter1.width},${painter1.height}");
      print("painter2 = ${painter2.width},${painter2.height}");
      print("painter3 = ${painter3.width},${painter3.height}");

      //??????????????????
      offset = getBoundaryOverflow(posX,offset,rect,painter2.width +painter3.width * 1.3);
      print("new offset = ${offset.x} ,${offset.y}");


      Offset pos1 = calculatePos2(
          posX + offset.x, posY + offset.y, painter2.width, painter2.height + painter3.height * 1.3 ); //1.3??????????????????
      print("pos1 = $pos1");

      Offset pos2 = calculatePos1(posX + offset.x, posY + offset.y, painter2.width, painter2.height); //????????????????????????????????????
      print("pos2 = $pos2");

      Offset pos3 = calculatePos3(pos2.dx + painter2.width * 1.05, posY + offset.y, painter3.width/3, painter3.height * 0.8);
      print("pos3 = $pos3");


      canvas.drawRRect(
          RRect.fromLTRBR(pos2.dx - 10, pos1.dy - 8, pos1.dx + painter2.width + painter3.width + 8,
              pos1.dy + painter2.height + painter3.height + 8, Radius.circular(10)),
          paint);
      painter1.paint(canvas, pos1);
      painter2.paint(canvas, pos2);
      painter3.paint(canvas,pos3);
      //????????????????????????

      Paint _paint = new Paint();
      _paint.strokeWidth = 2.0;
      _paint.color = _backColor;
      _paint.style = PaintingStyle.fill;

      bool isDown = true;
      Path path = new Path();
      if (isDown) {
        path.moveTo(posX - 10, 20.0);
        path.lineTo(posX + 10, 20.0);
        path.lineTo(posX, 35);
      } else {
        path.moveTo(painter1.width / 2.0, 0.0);
        path.lineTo(0.0, painter1.height + 1);
        path.lineTo(painter1.width, painter1.height + 1);
      }

      canvas.drawPath(path, _paint);

      //????????????
      path.reset();
      //left      pos2.dx - 10
      //top       pos1.dy - 8
      //right     pos1.dx + painter2.width + painter3.width + 8
      //buttom    pos1.dy + painter2.height + painter3.height + 8
    //  path.moveTo(pos2.dx - 10 - 2 , pos1.dy - 8 - 5); //5???????????????
    //  path.lineTo(pos1.dx + painter2.width + painter3.width + 8 + 2 , pos1.dy - 8  -5  );
    //  path.lineTo(pos1.dx + painter2.width + painter3.width + 8 + 2, pos1.dy + painter2.height + painter3.height + 8 +2 + 15 );
     // path.lineTo(pos2.dx - 10 -2 , pos1.dy + painter2.height + painter3.height + 8 +2 + 15 );
     // canvas.drawShadow(path,ColorUtils.RED,2,false);


      double left = pos2.dx  - 10 -1;
      double leftArc = left + 8;
      double top = pos1.dy - 8 -2;
      double topArc = top + 10;

      print('left = $left,leftArc = $leftArc');
      print('top = $top,leftArc = $topArc');

      double right = pos1.dx + painter2.width + painter3.width + 8 +1;
      double rightArc = right - 6;
      double bottom = pos1.dy + painter2.height + painter3.height + 8 ;
      double bottomArc = bottom - 6;

      path.moveTo(left  , topArc);
     // path.lineTo(leftArc , top);
      path.arcToPoint(Offset(leftArc,top),radius: Radius.circular(10),largeArc: false, clockwise: true);
      path.lineTo(rightArc, top);
     // path.lineTo(right , topArc);
      path.arcToPoint(Offset(right,topArc),radius: Radius.circular(10),largeArc: false, clockwise: true);
      path.lineTo(right, bottomArc);
     // path.lineTo(rightArc, bottom);
      path.arcToPoint(Offset(rightArc,bottom),radius: Radius.circular(10),largeArc: false, clockwise: true);

      path.lineTo(posX + 9, bottom);
      path.lineTo(posX, 35);
      path.lineTo(posX - 9, bottom);

      path.lineTo(leftArc, bottom);
      //path.lineTo(left,bottomArc);
      path.arcToPoint(Offset(left,bottomArc),radius: Radius.circular(10),largeArc: false, clockwise: true);

      canvas.drawShadow(path,ColorUtils.DKGRAY,1,false);

      canvas.restore();
    }
  }



}

