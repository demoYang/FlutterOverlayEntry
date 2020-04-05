import 'package:flutter/material.dart';
import 'package:flutter_demos/CustomAlert.dart';
import 'package:flutter_demos/NextWidet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/NextVC": (BuildContext context) {
          return NextWidget();
        }
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<OverlayState>  overlayKey = GlobalKey<OverlayState>();

  @override
  Widget build(BuildContext context) {
    Widget scaffold= 
    Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlatButton(
          key: globalKey,
          child: Text("充值"),
          onPressed: () {
            Navigator.of(context).pushNamed('/NextVC');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Show'),
        onPressed: (){
          // onButtonClick();
          showCustomDailog();
        },
      ),
    );

    //Notice[0]:111
    //直接使用showOverLayEntry() 会遇到 findrenderobject' was called on null 这问题,
    //添加一个FrameCallBack 就好
    WidgetsBinding.instance.addPostFrameCallback((_){
      showOverLayEntry();
    });

    OverlayEntry scaffoldOverlay =  OverlayEntry(builder: (BuildContext context){
      return scaffold;
    });

    // return scaffold;
    // Notice[1]:!!!
    // 这里自定义一个Overlay ,代替scaffold,将scaffold 封装在OverlayEntry,里面给Overlay
    return Overlay(key: overlayKey,initialEntries: [scaffoldOverlay]);
  }

  @override
  void dispose() {
    super.dispose();
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
    }
  }

  void onButtonClick() {
    if (overlayEntry == null) {
      showOverLayEntry();
    } else {
      removeOverLayEntry();
    }
  }

  void showOverLayEntry() {
    overlayEntry ??= getOverlayEntry();
    // Overlay.of(context).insert(overlayEntry);
    // Notice[2] :!!!!
    // 用自定义的OverlayEntry 展示气泡
    overlayKey.currentState.insert(overlayEntry);
  }

  void removeOverLayEntry() {
    overlayEntry.remove();
    overlayEntry = null;
  }

  void showCustomDailog(){
    showDialog(context: context, builder: (BuildContext context){
      return CustomAlert();
    });
  }

  OverlayEntry overlayEntry;

  GlobalKey globalKey = GlobalKey();

  OverlayEntry getOverlayEntry() {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    Offset offset = renderBox.localToGlobal(Offset.zero);
    return createOverlayEntry(offset);
  }
  OverlayEntry createOverlayEntry(Offset offset) {
    return OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        left: offset.dx - 10,
        top: offset.dy - 50,
        child: Material(
          child: Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
              // child: Text(
              //   "今日优惠",
              //   style: TextStyle(color: Colors.white),
              // ),
              child: Image.asset('images/recharge_befine.png'),
              height: 50,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
          ),
        ),
      );
    });
  }
}
