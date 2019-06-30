import 'package:flutter/material.dart';
import 'foundItem.dart';

class FoundPage extends StatefulWidget{
  @override
  _FooundState createState()=>_FooundState();

}

class _FooundState extends State<FoundPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Container(

        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft
              ,
              height: 52,
              color: Colors.grey,
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Text(foundmessage[0].name,style: TextStyle(color:Colors.blue)),
            ),
            Container(
              color: Colors.deepOrangeAccent,
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                  child:  Text(foundmessage[1].name,style: TextStyle(color:Colors.red)),
                    height: 50,
                    alignment: Alignment.centerLeft,
                  ),

                  Padding(

                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Divider(
                      height: 0.5,
                      color: Colors.amber,

                    ),

                  ),
                  Text(foundmessage[2].name,style: TextStyle(color:Colors.red)),
                ],

              )
            )
          ],
        ),


      ),

    );
  }
}