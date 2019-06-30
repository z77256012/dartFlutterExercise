import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'contacts/contaccts.dart';
import 'common/found.dart';
import 'USER/usersInfo.dart';
import 'USER/shopPage.dart';
class App extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<App> {
  var _currentIndex = 0;

  MessagePage messagePage;
  Contacts contacts;
  FoundPage foundPage;
  simpleDialogDemo usersInfo;
  shopList shoplist;
  currentPage(){
    switch(_currentIndex){
      case 0:
        if(messagePage == null){
          messagePage = MessagePage();
        }
        return messagePage;
      case 1:
        if(contacts == null){
          contacts = Contacts();
        }
        return contacts;
      case 2:
        if(foundPage == null){
          foundPage = FoundPage();
        }
        return foundPage;
      case 3:
        if(shoplist == null){
          shoplist = shopList();
        }
        return shoplist;

    }
  }

  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        imagePath != null
            ? Image.asset(
                imagePath,
                width: 32,
                height: 32,
              )
            :
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                border:  Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    right: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    top: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    ),
              ),),
              child:    SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  )
              ),
            ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )

      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("111");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {

              print("search");
              Navigator.pushNamed(context, "search");
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(500, 76, 10, 0),
                  items: <PopupMenuEntry>[
                      _popupMenuItem("发起群聊",imagePath: 'images/tab1_nor.png'),
                    _popupMenuItem("增加朋友",imagePath: 'images/tab1_nor.png'),
                    _popupMenuItem("扫一扫",imagePath: 'images/tab1_nor.png'),
                    _popupMenuItem("收付款",icon: Icons.crop_free),
                    _popupMenuItem("帮助与反馈",icon: Icons.email),
                  ],
                );
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          new BottomNavigationBarItem(
              title: Text(
                '微信',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 0
                  ? Image.asset(
                      "images/tab1_nor.png",
                      width: 32,
                      height: 28,
                    )
                  : Image.asset(
                      "images/tab1_sel.png",
                      width: 32,
                      height: 28,
                    )),
          new BottomNavigationBarItem(
              title: Text(
                '关注',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset(
                      "images/tab2_nor.png",
                      width: 32,
                      height: 28,
                    )
                  : Image.asset(
                      "images/tab2_sel.png",
                      width: 32,
                      height: 28,
                    )),
          new BottomNavigationBarItem(
              title: Text(
                '看点',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset(
                      "images/tab3_nor.png",
                      width: 32,
                      height: 28,
                    )
                  : Image.asset(
                      "images/tab3_sel.png",
                      width: 32,
                      height: 28,
                    )),
          new BottomNavigationBarItem(
              title: Text(
                '天下',
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 3
                  ? Image.asset(
                      "images/tab4_nor.png",
                      width: 32,
                      height: 28,
                    )
                  : Image.asset(
                      "images/tab4_sel.png",
                      width: 32,
                      height: 28,
                    )),
        ],
      ),
      body: currentPage(),
    );
  }
}
