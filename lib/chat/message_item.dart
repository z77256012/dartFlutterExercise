import 'package:flutter/material.dart';
import 'message_data.dart';
import 'package:date_format/date_format.dart';
import '../common/touch_callback.dart';

class MessageItem extends StatelessWidget {
  final MessageData message;
  MessageItem(MessageData message):this.message = message;
////  MessageItem(this.message);
//  MessageItem(this.message);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,
      child: TouchCallBack(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 13, right: 13),
                  child: Image.network(
                    message.avatar,
                    width: 45,
                    height: 45,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message.title,
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                        maxLines: 1,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Container(
                        color: Colors.red,
                        child:    Text(
                          message.subTitle,
                          style:
                          TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsets.only(right: 12, top: 12),
                  child: Text(
                    formatDate(message.time, [HH,':',nn,':','ss']).toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ]),
          onPresses: () {
              print(formatDate(message.time, [HH,':',nn,':','ss']).toString());


          }),
    );
  }
}
