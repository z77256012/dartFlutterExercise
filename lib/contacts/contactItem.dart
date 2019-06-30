import 'package:flutter/material.dart';
import 'contact_vo.dart';

class contactItem extends StatelessWidget {
  final ContactVo item;
  final String titleName;
  final String imageName;

  contactItem({this.item, this.titleName, this.imageName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))),
      height: 52.0,
      child: FlatButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              imageName == null
                  ? Image.network(item.avatarUrl != ''
                      ? item.avatarUrl
                      : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559155596443&di=a289aff99c69d5c3d1a1f118ae6ec998&imgtype=0&src=http%3A%2F%2Fpic30.nipic.com%2F20130608%2F12654543_081027504329_2.jpg")
                  : Image.asset(
                      imageName,
                      width: 36,
                      height: 36,
                    ),
              Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(titleName == null ? item.name ?? '暂时' : titleName),
              )
            ],
          )
      ),
    );
  }
}
