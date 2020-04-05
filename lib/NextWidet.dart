
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return _NextWidgetState();
  }
}

class _NextWidgetState extends State<NextWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:Text("Next VC")
      ),
      body: Container(
        color:Colors.white
      ),
    );
  }
}