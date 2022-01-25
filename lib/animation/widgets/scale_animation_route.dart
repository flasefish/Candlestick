
import 'package:flutter/cupertino.dart';

class ScaleAnimationRoute extends StatefulWidget{
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
    Animation<double> animation;
    AnimationController controller;

    @override
    void initState() {
    // TODO: implement initState
      super.initState();
      controller = AnimationController(
          duration: const Duration(seconds: 3),
          vsync: this,);

      //匀速
      //图片宽高从0变到300
      animation = Tween(begin: 0.0,end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {

        });
      });
      //启动动画(正向执行)
      controller.forward();
    }

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Image.asset(
          "images/icon_switch_open.png",
          width: animation.value,
          height: animation.value,
        ),
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

}