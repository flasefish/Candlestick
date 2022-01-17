import 'package:flutter/material.dart';

class SelectSwitchItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectSwitchItem();
}

class _SelectSwitchItem extends State<SelectSwitchItem>{
  bool  isSwitchCheck;
  String title;
  String content;
  TextAlign textAlign;
  TextStyle titleStyle;
  TextStyle contentStyle;
  double height;
  int isShowRightItem;//显示右侧控件(0不显示，1显示箭头，2显示开关)
  String imageName;//左侧图片名字 不传则不显示图片
  @override
  Widget build(BuildContext context) {
    return Container(
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
                setState(() {
                  this.isSwitchCheck = value;
                });
              },
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ) : Container(),
          ],
        ),
    );
  }
}