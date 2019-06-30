import 'package:flutter/material.dart';
import 'shopList.dart';
class shopList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return contionBloc(
      child: Scaffold(
        body:shopLists() ,
      ),
      bloc: blocAction(),
    );
  }

}