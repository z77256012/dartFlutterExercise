import 'package:flutter/material.dart';
import 'touch_callback.dart';
class WechatItem extends StatelessWidget{
  final String title;
  final String imagePath;
  final Icon icon;
  WechatItem({Key key,this.title,this.imagePath,this.icon}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TouchCallBack(child: Container(
      height: 50,
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(imagePath,width: 32,height: 32,),
            margin: EdgeInsets.only(left: 22,right: 20),
          ),
          Text(title,style: TextStyle(fontSize: 16),),
        ],
      ),


    ), onPresses: (){
      print("点击了 ${title}");
    });
  }
}