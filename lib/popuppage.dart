

import 'package:flutter/material.dart';
import 'package:popup_menu/popup_menu.dart';


class PopupMenuPage extends StatefulWidget {
  const PopupMenuPage({Key key}) : super(key: key);


  @override
  State<PopupMenuPage> createState() => _PopupMenuPageState();
}

class _PopupMenuPageState extends State<PopupMenuPage> {
  PopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  GlobalKey btnKey3 = GlobalKey();



  @override
  void initState(){
    super.initState();
  /*  menu = PopupMenu(items: [
      // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
      // MenuItem(title: 'Home', image: Icon(Icons.home, color: Colors.white,)),
      MenuItem(
          title: 'Mail',
          image: Icon(
            Icons.mail,
            color: Colors.white,
          )),
      MenuItem(
          title: 'Power',
          image: Icon(
            Icons.power,
            color: Colors.white,
          )),
      MenuItem(
          title: 'Setting',
          image: Icon(
            Icons.settings,
            color: Colors.white,
          )),
      MenuItem(
          title: 'PopupMenu',
          image: Icon(
            Icons.menu,
            color: Colors.white,
          ))
    ], onClickMenu: onClickMenu, onDismiss: onDismiss, maxColumn: 4);*/
  }

  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  void onClickMenu(MenuItemProvider item) {
    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;

    int nowyear = DateTime.now().year; //今年
    int nowmonth = DateTime.now().month; //这个月是几月
    int nowday = DateTime.now().day; //今天
    int weekday = DateTime.now().weekday; //今天是本周的第几天
    String weekstart =
    new DateTime(nowyear, nowmonth, nowday - weekday + 1).toString(); //本周一的时间
    String weekend =
    new DateTime(nowyear, nowmonth, nowday - weekday + 7).toString(); //本周日的时间

    print("weekstart = $weekstart,weekend = $weekend");

    String lastweekstart =
    new DateTime(nowyear, nowmonth, nowday - weekday -6).toString(); //本周一的时间
    String lastweekend =
    new DateTime(nowyear, nowmonth, nowday - weekday ).toString(); //本周日的时间
    print("lastweekstart = $lastweekstart,lastweekend = $lastweekend");


    return Scaffold(
      appBar: AppBar(title: Text('popop menuc'),),
      body: Container(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              Container(
                color: Colors.blue,
                child:MaterialButton(
                  height: 45,
                  key:btnKey,
                  onPressed: maxColumn,
                  child: Text('Show Menu'),
                ),
              ),
            Container(
              child: MaterialButton(
                key:btnKey2,
                height: 45,
                  onPressed: customBackground,
                child: Text('Show Menu'),
              ),
            ),
            Container(
              child: MaterialButton(
                key: btnKey3,
                height: 45.0,
                onPressed: onDismissOnlyBeCalledOnce,
                child: Text('Show Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDismissOnlyBeCalledOnce() {
    menu.show(widgetKey: btnKey3);
  }




  void maxColumn(){
    PopupMenu menu = PopupMenu(
        maxColumn: 3,
        items: [
          MenuItem(title: 'Copy',image: Image.asset('images/copy.png')),
          MenuItem(title: 'Power',image: Icon(Icons.power,color: Colors.white)),
          MenuItem(title: 'Setting', image: Icon(Icons.settings,color: Colors.white)),
          MenuItem(title: 'PopupMenu',image: Icon(Icons.menu,color: Colors.white))
        ],
        onClickMenu: onClickMenu,
        stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey);

  }

  void customBackground() {
    PopupMenu menu = PopupMenu(
      // backgroundColor: Colors.teal,
      // lineColor: Colors.tealAccent,
      // maxColumn: 2,
        items: [
          MenuItem(title: 'Copy', image: Image.asset('images/copy.png')),
          MenuItem(
              title: 'Home',
              // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
              image: Icon(
                Icons.home,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Mail',
              image: Icon(
                Icons.mail,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Power',
              image: Icon(
                Icons.power,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Setting',
              image: Icon(
                Icons.settings,
                color: Colors.white,
              )),
          MenuItem(
              title: 'PopupMenu',
              image: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
        onClickMenu: onClickMenu,
        stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey2);
  }


}