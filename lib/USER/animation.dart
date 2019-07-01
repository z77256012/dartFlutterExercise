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
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationDemoController = AnimationController(

//      lowerBound: 32,
//      value: 32,
        vsync: this,
//        lowerBound: 0.0,
//        upperBound: 100.0,
        duration: Duration(milliseconds: 1000));

    curve = CurvedAnimation(parent: animationDemoController, curve: Curves.bounceOut);
    animation =  Tween(begin: 32.0,end: 100.0).animate(curve);
    animationColor = ColorTween(begin: Colors.red,end: Colors.red[900]).animate(animationDemoController);

    
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
      child: AnimateHeart(
        animations: [
          animationColor,
          animation
        ],
        controller: animationDemoController,
      ),

    );
  }
}

class AnimateHeart extends AnimatedWidget{
  final List animations;
  final AnimationController controller;

  AnimateHeart({
    this.animations,this.controller
  }) : super(listenable : controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  IconButton(
        iconSize: animations[1].value,
        color: animations[0].value,
        icon:Icon(Icons.favorite),

        onPressed: (){
          switch (controller.status){
            case AnimationStatus.completed:
              controller.reverse();
              break;
            default:
              controller.forward();
              break;
          }
        });
  }
}