import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class shopLists extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//
//      body: Swiper(itemCount: 3,
//      itemBuilder: (BuildContext,index){
////        return Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559155596443&di=a289aff99c69d5c3d1a1f118ae6ec998&imgtype=0&src=http%3A%2F%2Fpic30.nipic.com%2F20130608%2F12654543_081027504329_2.jpg");
//        return Text("dddddss");
//      },
//        onTap: (int index){
//        print(" 点击了$index");
//        },
//        autoplay: true,
//      ),
//
//    );
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    blocAction blocSource = contionBloc.of(context).bloc;
    return Scaffold(
        body: FlatButton(
      onPressed: () {
//        blocSource.log();

        blocSource.conter.add(1);
      },
      child: StreamBuilder(
          builder: (context, snapshot) => Text('${snapshot.data}'),
      initialData: 0,
      stream: blocSource.count,
    )
    ));
  }
}

class actionBloc extends InheritedWidget{
  Widget child;
  blocLog bloc;

  static actionBloc of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(actionBloc);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}

class blocLog{

  int count = 0;
  final stringController = StreamController();
  StreamSink<int> get stringSink => stringController.sink;

  final streamWidget = StreamController();
  Stream<int> get stream => streamWidget.stream;

  blocLog(){
    stringController.stream.listen(onData);
  }

  void onData(int index){

    count = count + index;
    streamWidget.add(count);
  }
}

class contionBloc extends InheritedWidget {
  Widget child;
  blocAction bloc;

  contionBloc({Key key, this.child, this.bloc}) : super(key: key);
  static contionBloc of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(contionBloc);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

class blocAction {
  int _count = 0;
  final _stream = StreamController<int>();
  StreamSink<int> get conter => _stream.sink;

  final _countCountroller = StreamController<int>();
  Stream<int> get count => _countCountroller.stream;
  blocAction() {
    _stream.stream.listen(onData);
  }

  void onData(int data) {
    print('点击 $data');
    _count = data + _count;
    _countCountroller.add(_count);
  }

  void disponse() {
    _stream.close();
    _countCountroller.close();
  }

  void log() {
    print("111121");
  }
}
