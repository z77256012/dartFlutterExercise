import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'contact_vo.dart';
import 'contact_header.dart';
import 'contact_sider_list.dart';
import 'contactItem.dart';

class Contacts extends StatefulWidget{
  @override
  ContactState createState() => ContactState();
}

class ContactState extends State<Contacts>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ContactSiderList(item: contactData, headerBuilder: (BuildContext context,int index)
          {
            return Container(
              child: ContactHeader()
              ,);
          }

          ,itemBuilder: (BuildContext context,int index)
          {
            return Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: contactItem(item: contactData[index],),
            );
          }

          , sectionBuilder: (BuildContext context,int index)
      {
        return  Container(
          height: 32,
          padding: EdgeInsets.only(left: 14),
          color: Colors.grey[300],
          alignment: Alignment.centerLeft,
          child: Text(contactData[index].seationKey,style: TextStyle(fontSize: 14,color: Colors.blue),),
        );
      }),

    );
  }
}