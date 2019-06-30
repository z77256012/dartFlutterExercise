import 'package:flutter/material.dart';
import 'dart:async';

class loadingPage extends StatefulWidget {
  @override
  _loadingState createState() => new _loadingState();
}

class _loadingState extends State<loadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration(seconds: 3), () {
      print("启动页启动");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset("images/loading.jpg"),
    );
  }
}
