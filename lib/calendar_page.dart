

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

List<DateTime> presentDates = [
  DateTime(2019, 2, 1),
  DateTime(2019, 2, 3),
  DateTime(2019, 2, 4),
  DateTime(2019, 2, 5),
  DateTime(2019, 2, 6),
  DateTime(2019, 2, 9),
  DateTime(2019, 2, 10),
  DateTime(2019, 2, 11),
  DateTime(2019, 2, 15),
  DateTime(2019, 2, 11),
  DateTime(2019, 2, 15),
];
List<DateTime> absentDates = [
  DateTime(2019, 2, 2),
  DateTime(2019, 2, 7),
  DateTime(2019, 2, 8),
  DateTime(2019, 2, 12),
  DateTime(2019, 2, 13),
  DateTime(2019, 2, 14),
  DateTime(2019, 2, 16),
  DateTime(2019, 2, 17),
  DateTime(2019, 2, 18),
  DateTime(2019, 2, 17),
  DateTime(2019, 2, 18),
];

class _CalendarPageState extends State<CalendarPage> {

   CalendarCarousel _calendarCarouselNoHeader;

  var len = 9;
   double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (date, events) {
        print(date);
        List<String> selDate = date.toString().split(" ");
        Navigator.pop(context,selDate[0]);
        //widget.tapBack();
      },
      height: cHeight * 0.54,
      weekendTextStyle: const TextStyle(color: Colors.black,), //周末的字体颜色
      todayButtonColor: const Color.fromRGBO(231, 245, 255, 1),  //today的选中颜色
      todayTextStyle:const  TextStyle(color: Colors.black,), //today字体颜色
      selectedDayTextStyle:const TextStyle(color: Colors.black, ), //选中字体的颜色

      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only( left: 15,right: 18 , top: 0.0),
              height: 250,
              decoration: BoxDecoration(color:Color(0xFFFFFFFF)),
              child: _calendarCarouselNoHeader,
            ),
            GestureDetector(
              child:
              Container(
                color: Colors.white,
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: EdgeInsets.only( left: 30,right: 30 , top: 15.0),
                child: Text(
                  "今天",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF007AFF), fontSize: 14,fontWeight: FontWeight.bold,backgroundColor: Colors.white), // give any color here
                  //  style: TextStyle(
                  ///     color: Color(0xFF007AFF), fontSize: 28.0.sp,fontWeight: FontWeight.bold,background:Paint()..color = Color(0xFFFFFFFF)),
                ),
              ),
              onTap: () {
                setState(() {

                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return ListTile(
      leading:  CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title:  Text(
        data,
      ),
    );
  }
}
