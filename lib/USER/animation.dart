import 'package:flutter/material.dart';


class animations extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return animationDemo();
  }
}


class animationDemo extends StatefulWidget{

  animationState createState()=> animationState();
}


class animationState extends State<animationDemo> with TickerProviderStateMixin{
  AnimationController animationDemoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationDemoController = AnimationController(
      value: 32,
        vsync: this,
//        lowerBound: 0.0,
        upperBound: 100.0,
        duration: Duration(milliseconds: 3000));

    animationDemoController.addListener((){
      print("${animationDemoController.value}");
      setState(() {

      });


    });
    animationDemoController.addStatusListener((AnimationStatus status){
      print(status);

    });


  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationDemoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      
      child: IconButton(
          iconSize: animationDemoController.value,
          icon:Icon(Icons.favorite),
          onPressed: (){

            animationDemoController.forward();
          }),
    );
  }
}