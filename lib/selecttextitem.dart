import 'package:flutter/material.dart';

class SelectTextItem extends StatelessWidget {
   SelectTextItem({
    Key key,
    @required this.title,
    this.onTap,
    this.content: "",
    this.textAlign: TextAlign.start,
    this.titleStyle,
    this.contentStyle,
    this.height,
    this.isShowRightItem: 0,
    this.imageName,
  }): super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final double height;
  final int isShowRightItem;//显示右侧控件(0不显示，1显示箭头，2显示开关)
  final String imageName;//左侧图片名字 不传则不显示图片
  bool  isSwitchCheck;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: this.height ?? 60.0,
        margin: EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        decoration:  BoxDecoration(
          border: Border(
            //下面的分割线 width 这个参数应该是控制分割线高度的
            bottom: Divider.createBorderSide(context, color: Color(0xFFFFFFFF),width: 0)
          )
        ),
        child:
        Row(
          children: <Widget>[
            this.imageName == null ? Container() :
             Image.asset(
              '${this.imageName}',
              width: 22,
              height: 22,
            ),
            Text(
              this.title,
              style: this.titleStyle ?? new TextStyle(
                color: Color(0xFF333333),
                fontSize: 14.0,
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  this.content,
                  textAlign: this.textAlign,
                  overflow: TextOverflow.ellipsis,
                  style: this.contentStyle ?? new TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFFCCCCCC),
                  )
                ),
              ),
            ),
            this.isShowRightItem==1 ? Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ) : Container(),
            this.isShowRightItem==2?Switch(
              value: this.isSwitchCheck,
              onChanged: (value) {
              },
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ) : Container(),
          ],
        ),
      ),
    );
  }
}