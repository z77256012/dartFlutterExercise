import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget{
  final Widget child;
  final VoidCallback onPresses;
  final bool isfeed;
  final Color background;
  TouchCallBack({Key key,
    @required this.child,
    @required this.onPresses,
    this.isfeed:true,
    this.background:const Color(0xff8d8d8),
    }):super(key:key);
  @override
  TouchState createState() => TouchState();
}

class TouchState extends State<TouchCallBack>{
  Color  color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return GestureDetector(
        child: Container(
          color: color,
          child: widget.child,
        ),
        onTap: widget.onPresses,
        onPanDown: (d){
          if (widget.isfeed == false) return;
          setState(() {
            color = widget.background;
          });
        },
        onPanCancel: (){
          setState(() {
            color = Colors.transparent;
          });
        },
      );
  }
}