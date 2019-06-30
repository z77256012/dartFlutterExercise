import 'package:flutter/material.dart';
import 'common/touch_callback.dart';

class Search extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//  }
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  FocusNode focusNode = FocusNode();
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  _getText(String text) {
   return TouchCallBack(
      onPresses: () {
        print(text);
      },
      isfeed: false,
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Color(0xff4aad19)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                TouchCallBack(
                  isfeed: false,
                  onPresses: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45.0,
                    margin: EdgeInsets.only(left: 12.0, right: 10.0),
                    child: Icon(Icons.chevron_left,
                    color: Colors.black,),
                  ),
                ),



                Container(
                  alignment: Alignment.centerLeft,
                  height: 45,
                  margin: EdgeInsets.only(left: 50, right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.green))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        onChanged: (String text) {},
                        decoration: InputDecoration(
                            hintText: '搜索', border: InputBorder.none),
                      )),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.mic),
                        color: Color(0xffaaaaaa),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "搜索指定文章",
                style: TextStyle(fontSize: 16.0, color: Color(0Xffb5b5b5)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText("朋友圈"),
                  _getText("文章"),
                  _getText("公众号"),
//                  Text(
//                    "小程序",
//                    style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
//                  ),
//                  Text(
//                    "小程序",
//                    style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
//                  ),
//                  Text(
//                    "小程序",
//                    style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
//                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText("小程序"),
                  _getText("音乐"),
                  _getText("表情"),
//                  Text(
//                    "小程序",
//                    style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
//                  ),
//                  Text(
//                    "小程序",
//                    style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
//                  ),
//                  Text(
//                    "小程序",
//                    style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
//                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
