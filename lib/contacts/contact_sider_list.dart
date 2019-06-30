import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'contact_vo.dart';

class ContactSiderList extends StatefulWidget{
  final List<ContactVo> item;
  final IndexedWidgetBuilder headerBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder sectionBuilder;


  ContactSiderList({Key key,@required this.item,
      this.headerBuilder,
      @required this.itemBuilder,
      @required this.sectionBuilder}):super(key:key);

  ContactState createState() => ContactState();
}

class ContactState extends State<ContactSiderList> implements SectionInderxer{

  Color _pressColor = Colors.transparent;
  final ScrollController _scrollController = ScrollController();
  bool _onNotification(ScrollNotification notification){
    if(notification is ScrollEndNotification){
      if(notification.metrics.extentAfter == 0.0){

      }
      if(notification.metrics.extentBefore == 0.0){

      }
    }
    return true;
  }

  _isShowHeaderView(index){
    if(index == 0 && widget.headerBuilder != null){
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context,index),
      );
    }
    return Container(
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
            controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: widget.item.length,
              itemBuilder: (BuildContext context,int index){
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        _isShowHeaderView(index),
                        Offstage(
                          offstage: _shouldShowHeader(index),
                          child: widget.sectionBuilder(context,index),
                        ),
//                        Column(
//                        <Widget>[
                            widget.itemBuilder(context,index),
//                          ],

                      ],
                    ),
                  );
              }

            ),
          ),

          Positioned(
              right: 0,
              child:Container(
                alignment: Alignment.center,
                height:  MediaQuery.of(context).size.height,
                width: 32,
                color: _pressColor,
                child: GestureDetector(
                  onTapDown: (TapDownDetails t){
                    setState(() {
                      _pressColor = Colors.grey;
                    });
                  },
                  onTapUp: (TapUpDetails t){
                    setState(() {
                      _pressColor = Colors.grey;
                    });
                  },
                  onVerticalDragStart: (DragStartDetails details){
                    setState(() {
                      _pressColor = Colors.grey;
                    });
                  },
                  onVerticalDragEnd: (DragEndDetails details){
                    setState(() {
                      _pressColor = Colors.transparent;
                    });
                  },
                  child: ListView.builder(itemBuilder: (BuildContext context,int index){
                    return Container(
                      alignment: Alignment.center,
                      height: 17,
                      child:Text(siderBarKey[index]),

                    );
                  },
                    itemCount: siderBarKey.length,
                ),
              ),
              ),)
        ],
      ),
    );
  }

  @override
  listScrollToPosition(int index){
    for(var i = 0; i < widget.item.length;i++){
      if(siderBarKey[index] == '-'|| siderBarKey[index] == '^'){
        _scrollController.jumpTo(0.0);
        setState(() {

        });
        return -1;
      }else if(widget.item[i].seationKey == siderBarKey[index])
        return i;
    }
    return -1;
  }

  bool _shouldShowHeader(int position){
    if(position < 0) return false;
    if(position == 0) return false;
    if(position != 0 && widget.item[position].seationKey != widget.item[position-1 ].seationKey )
      return false;
    return true;
  }
}

abstract class SectionInderxer{
  listScrollToPosition(int index);
}

const siderBarKey = <String>[
  '_',
  'A',
  'B',
  'C'

];