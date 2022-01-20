import 'package:candlestick/animation/animation_text.dart';
import 'package:candlestick/animation/baby_animation.dart';
import 'package:candlestick/animation/baby_originpage_sqit.dart';
import 'package:candlestick/animation/titled_navigation_bar.dart';
import 'package:candlestick/candlestick.dart';
import 'package:flutter/material.dart';

import 'animation/animated_opacity_page.dart';

class mainAnimation extends StatefulWidget {
  const mainAnimation({Key key,  this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<mainAnimation> createState() => _mainAnimationState();
}

class _mainAnimationState extends State<mainAnimation> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }


  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //do your stuff
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light, //设置为白色字体
        title: Text('选项'),
      ),
      body: ListView.builder(
        itemCount: demosAnimation.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onPressed: () {
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => demosAnimation[index].demo,
                  ),
                );*/
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => demosAnimation[index].demo,
                  ),
                ).then((value) {
                 //_refreshFirstPage();
                  print("123");
                });
              },
              child: Text(demosAnimation[index].title),
            ),
          );
        },
      ),
    );
  }
}

final List<AnimationListViewModal> demosAnimation = [
  AnimationListViewModal(
    title: '动画1',
    demo: AnimatedOpacityPage(),
  ),

  AnimationListViewModal(
    title: '动画2',
    demo: AnimationTextWidget(),
  ),

  AnimationListViewModal(
    title: '动画3',
    demo: MyTitledNavigationBar(),
  ),

  AnimationListViewModal(
    title: 'babyAnimation',
    demo: BabyAnimation(),

  ),

  AnimationListViewModal(
    title: '原始页面分割',
    demo: BabyOriginPageSqit(),

  ),

];
class AnimationListViewModal {
  final String title;
  final Widget demo;

  AnimationListViewModal({this.title, this.demo});
}
