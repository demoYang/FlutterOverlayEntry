import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget material = Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 246.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("充值说明"),
                  Text("充值说明"),
                  Text("充值说明"),
                  Text("充值说明"),
                  Text("充值说明"),
                  Text("充值说明"),
                  Text("充值说明"),
                  FlatButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Close"))
                ],
              ))
        ],
      ),
      // child: Container(
      //   alignment: Alignment.center,
      //   child: Container(
      //     color:Colors.white,

      // ),
    );

    return material;
  }
}
