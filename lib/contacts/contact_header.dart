import 'package:flutter/material.dart';
import './contactItem.dart';
class ContactHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        contactItem(titleName:'新的朋友',imageName:'images/icon_addfriend.png'),
        contactItem(titleName:'新的朋友',imageName:'images/icon_addfriend.png'),
        contactItem(titleName:'新的朋友',imageName:'images/icon_addfriend.png'),
      ],
    );
  }


}