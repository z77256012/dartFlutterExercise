import 'package:flutter/material.dart';
import 'package:wechat/common/wechat_item.dart';


class simpleDialogDemo extends StatefulWidget{
  _simpleDialogDemoState createState() => _simpleDialogDemoState();
}

class _simpleDialogDemoState extends State<simpleDialogDemo>{

  int pageSize = 0;
  final scrollowController = ScrollController();
  List<String> list = List<String>();
 GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    showRefreshLoading();
    scrollowController.addListener((){

      if(scrollowController.position.pixels == scrollowController.position.maxScrollExtent){
        loadMoreDataSource();
      }
    });
    super.initState();
  }
  //加载更多

  loadData(int index){

    for(int i = 0; i < 15; i++){
      list.add((i + index * 15).toString());
    }

  }

  Future<Null>  loadMoreDataSource(){
  return  Future.delayed(Duration(seconds: 1),(){
    print("正在ddddd...");
      setState(() {
        if(this.pageSize >=1 ){
          this.pageSize = 1;
          return;
        }
        this.pageSize ++;
        loadData(pageSize);
      });
  });
  }

  Future<Null> _onRefresh() {
    return Future.delayed(Duration(seconds: 2), () {
      print("正在刷新...");
      pageSize = 0;
      list.clear();
      setState(() {
        loadData(pageSize);
      });
    });
  }

  showRefreshLoading(){
    Future.delayed(Duration(seconds: 0),(){
      _refreshKey.currentState.show().then((e){});
      return true;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(child: ListView.separated(
        itemBuilder: (buildContext,index){
          return items(context, index);
        },
        separatorBuilder: (buildContext, index) {
          return Divider(
            height: 1,
            color: Colors.lightGreen,
          );
        },
        controller: scrollowController,
        itemCount: list.isEmpty ? 0 : list.length+1),
        onRefresh: _onRefresh,key: _refreshKey,);
  }

  Widget items(context, index) {
    if (index == list.length) {
      if(index >= 30){
        return Text("没有其他的了");
      }
      return Container(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "正在加载",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.deepPurple
                    ),
                  )
                ],
              ),
            )
        ),
      );
    }

    if (index >= 30) {
      return Text("没有其他的了");
    }else{
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text.rich(TextSpan(
              children: [
                TextSpan(text: "我是第"),
                TextSpan(
                    text: "${list[index]}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(text: "个")
              ]
          )),
        )
    );}
  }

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('simpleDialogDemo'),
//        elevation: 0.0,
//      ),
//      body: Container(
//        padding: EdgeInsets.all(16),
//        child: Column(
//
//        ),
//
//      ),
//      floatingActionButton: FloatingActionButton(onPressed: (){}
//      ,
//      child: Icon(Icons.format_list_numbered),
//
//      ),
//    );
//  }
}

//
//class UsersInfo extends StatefulWidget {
//  @override
//  userInfoSource createState() => userInfoSource();
//}
//
//class userInfoSource extends State<UsersInfo> {
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    controller.addListener((){
//      debugPrint(controller.text);
//
//    });
//  }
//  final controller = TextEditingController();
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Column(
//        children: <Widget>[
//         Container(
//           height: 60,
//           child: Stack(
//
//           ),
//         ),
//
//    Container(
//    margin: EdgeInsets.only(left: 12,right: 12),
//    child:  TextFormField(
//      controller: controller,
//
//    decoration: InputDecoration(
//    hintText: "help",
//    helperText: "帮助",
//    icon: Icon(Icons.subject),
//    border: OutlineInputBorder()
//    ),
//
//    )
//
//
//    )
//        ],
//
//    );
//  }
//
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return CustomScrollView(
////      slivers: <Widget>[
////        SliverAppBar(
////          expandedHeight: 200,
////          floating: true,
////          flexibleSpace: FlexibleSpaceBar(
////            title: Text(
////              "notes",
////              style: TextStyle(
////                letterSpacing: 2,
////              ),
////            ),
////            background: Image.network(
////                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560237423148&di=9bf0492c66d07ec6ce31c349588fd924&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F822104b64866255bca9fd34587df04151de69bce1fe47-78xSd7_fw658"),
////          ),
////        ),
////        SliverSafeArea(
////          sliver: SliverPadding(
////            padding: EdgeInsets.only(top: 20),
////            sliver: setttyboList(),
////          ),
////        )
////      ],
////    );
////  }
//}
//
////class setttyboList extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return SliverList(
////      delegate: SliverChildBuilderDelegate(
////        (BuildContext context, int index) {
////          return Padding(
////            padding: EdgeInsets.only(bottom: 20),
////            child: Stack(
////              children: <Widget>[
////                AspectRatio(
////                  aspectRatio: 5 / 3,
////                  child: Image.network(
////                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560161150494&di=95643cdb2100481658e2bc4c3dec0b3a&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fcloth%2F201207%2F201207050859392303.jpg",
////                    fit: BoxFit.cover,
////                  ),
////                ),
//////           Text("meeting and jacks man")
////              ],
////            ),
////          );
////        },
////        childCount: 10,
////      ),
////    );
////  }
////}
////
////class settyboDemo extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return SliverGrid(
////        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
////          return Image.network(
////              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560237423149&di=42516b55e1c258dee6b4979bc904493e&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F81e8e94c035a91a5a4a0ea5f3e7ab6112254b11611bc4-As11tm_fw658");
////        }, childCount: 10),
////        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////            crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20));
////  }
////}
////
////class settyboState extends State<UsersInfo> {
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return Scaffold(
////      body: CustomScrollView(
////        slivers: <Widget>[
////          SliverAppBar(
//////                  floating: true,
////            expandedHeight: 178.0,
////            elevation: 0,
////            flexibleSpace: FlexibleSpaceBar(
////              title: Text(
////                "settybo".toUpperCase(),
////                style: TextStyle(
////                  fontSize: 15.0,
////                  letterSpacing: 3.0,
////                  fontWeight: FontWeight.w400,
////                ),
////              ),
////              background: Image.network(
////                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560175850134&di=cee805d4e461d09590f3c2ce75d1ebd9&imgtype=0&src=http%3A%2F%2Fpic8.nipic.com%2F20100805%2F5484601_004944122176_2.jpg",
////                fit: BoxFit.fill,
////              ),
////            ),
////          ),
////          SliverSafeArea(sliver: griwView())
////        ],
////      ),
////    );
////  }
////}
////
////class SettyBoState extends State<UsersInfo> {
////  @override
////  void initState() {
////    // TODO: implement initState
////    super.initState();
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return CustomScrollView(
////      slivers: <Widget>[
////        SliverAppBar(
////          expandedHeight: 120,
////          floating: true,
////          flexibleSpace: FlexibleSpaceBar(
////            title: Text(
////              "ddd".toUpperCase(),
////            ),
////            background: Image.network(
////              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560191960142&di=837891526239039537ad92f4f5153941&imgtype=0&src=http%3A%2F%2Fimg01.3dmgame.com%2Fuploads%2Fallimg%2F140402%2F153_140402143504_1_lit.jpg",
////              fit: BoxFit.cover,
////            ),
////          ),
////        ),
////        SliverSafeArea(
////          sliver: SliverPadding(
////            padding: EdgeInsets.only(top: 20),
////            sliver: SliverListDemo(),
////          ),
////        ),
////      ],
////    );
////  }
////}
////
////class SliverListDemo extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return SliverList(
////      delegate: SliverChildBuilderDelegate(
////        (BuildContext context, int index) {
////          return Padding(
////            padding: EdgeInsets.only(bottom: 32.0),
////            child: Material(
////              borderRadius: BorderRadius.circular(12.0),
////              elevation: 14.0,
////              shadowColor: Colors.grey.withOpacity(0.5),
////              child: Stack(
//////                alignment: Alignment(0, 0),
////                children: <Widget>[
////                  AspectRatio(
////                    aspectRatio: 16 / 9,
////                    child: Image.network(
////                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560161150494&di=95643cdb2100481658e2bc4c3dec0b3a&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fcloth%2F201207%2F201207050859392303.jpg",
////                      fit: BoxFit.cover,
////                    ),
////                  ),
//////                  Positioned(
//////                    top: 32.0,
//////                    left: 32.0,
//////                    child: Column(
//////                      crossAxisAlignment: CrossAxisAlignment.center,
//////                      mainAxisAlignment: MainAxisAlignment.center,
//////                      children: <Widget>[
////                  Text(
////                    "123",
////                    style: TextStyle(
////                      fontSize: 20.0,
////                      color: Colors.white,
////                    ),
////                  ),
////                  Text(
////                    "345",
////                    style: TextStyle(fontSize: 13.0, color: Colors.white),
////                  ),
//////                      ],
//////                    ),
//////                  ),
////                ],
////              ),
////            ),
////          );
////        },
////        childCount: 10,
////      ),
////    );
////  }
////}
////
////class griwView extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return SliverGrid(
////      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
////        return Material(
////          borderRadius: BorderRadius.circular(12),
////          shadowColor: Colors.grey.withOpacity(12),
////          elevation: 15,
////          child: AspectRatio(
////            child: Image.network(
////              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560188551365&di=a679b1234dfba7305a5092816ec4724b&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fdbbbbf82e6a7d1981ac2c0473121b990269c896e166e8-RAaza0_fw658",
////              fit: BoxFit.cover,
////            ),
////          ),
////        );
////      }, childCount: 20),
////      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////        crossAxisCount: 2,
////        mainAxisSpacing: 20,
////        crossAxisSpacing: 20,
////      ),
////    );
////  }
////}
////
////class grivdList extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return SliverList(delegate: SliverChildBuilderDelegate(
////      (BuildContext context, int index) {
////        return null;
////      },
////    ));
////  }
////}
////
////class gridView extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return SliverGrid(
////      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////          crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 20),
////      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
////        return Container(
////          margin: EdgeInsets.only(top: 20),
////          child: Image.network(
////            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560175850134&di=f61a564b784b9a92fc276cee13bea74c&imgtype=0&src=http%3A%2F%2Fpic.eastlady.cn%2Fuploads%2Ftp%2F201708%2F9999%2F8aa8a85f3b.jpg",
////            fit: BoxFit.cover,
////          ),
////        );
////      }, childCount: 20),
////    );
////  }
////}
////
////class UsersState extends State<UsersInfo> {
////  @override
////  void initState() {
////    // TODO: implement initState
////    super.initState();
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return Scaffold(
////      body: ListView(
////        children: <Widget>[
////          Container(
////            margin: EdgeInsets.only(top: 20),
////            height: 80,
////            color: Colors.white,
////            child: Row(
////              crossAxisAlignment: CrossAxisAlignment.center,
////              children: <Widget>[
////                Container(
////                  margin: EdgeInsets.only(left: 12, right: 15),
////                  child: Image.network(
////                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559673669602&di=a776141f571fe937766a25fb5cf8103f&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F02%2F99%2F71%2F5adf15f459d04_610.jpg",
////                    width: 50,
////                    height: 50,
////                  ),
////                ),
////                Expanded(
////                  child: Container(
////                    color: Colors.amber,
////                    child: Column(
////                      crossAxisAlignment: CrossAxisAlignment.start,
////                      mainAxisAlignment: MainAxisAlignment.center,
////                      children: <Widget>[
////                        Text(
////                          "茹茹",
////                          style:
////                              TextStyle(fontSize: 18, color: Color(0xFF353535)),
////                        ),
////                        Text(
////                          "z7872224",
////                          style:
////                              TextStyle(fontSize: 14, color: Color(0xFFa9a9a9)),
////                        ),
////                      ],
////                    ),
////                  ),
////                ),
////                Container(
////                  margin: EdgeInsets.only(left: 12, right: 15),
////                  child: Text("老离开"),
////                ),
////              ],
////            ),
////          ),
////
//////          Container(
//////
//////            margin: EdgeInsets.only(top: 20),
//////            height: 40,
//////            child: Container(
//////              alignment: Alignment.centerLeft,
//////              child: Image.asset("images/tab1_nor.png",width: 20,height: 20,),
//////              color: Colors.amber,
//////            ),
//////
//////          ),
////
////          Container(
////            margin: EdgeInsets.only(top: 20),
////            color: Colors.white,
////            child: WechatItem(
////              title: "钱包",
////              imagePath: "images/tab4_sel.png",
////            ),
////          ),
////
////          Container(
////            margin: EdgeInsets.only(top: 20),
////            color: Colors.white,
////            child: Column(
////              children: <Widget>[
////                WechatItem(
////                  title: "附近的人",
////                  imagePath: "images/tab3_sel.png",
////                ),
////                Padding(
////                  padding: EdgeInsets.only(left: 15, right: 15),
////                  child: Divider(
////                    height: 0.5,
////                    color: Colors.grey,
////                  ),
////                ),
////                WechatItem(
////                  title: "说的是人",
////                  imagePath: "images/tab2_sel.png",
////                ),
////                Padding(
////                  padding: EdgeInsets.only(left: 15, right: 15),
////                  child: Divider(
////                    height: 2,
////                    color: Colors.red,
////                  ),
////                ),
//////
//////                WechatItem(title: "附近的人",imagePath: "images/tab1_sel.png",),
//////                Padding(padding: EdgeInsets.only(left: 15,right: 15),
//////                  child: Divider(
//////                    height:1,
//////                    color: Colors.grey,
//////                  ),
//////
//////                ),
////              ],
////            ),
////          ),
////        ],
////      ),
////    );
////  }
////}
