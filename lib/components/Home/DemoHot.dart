import 'package:flutter/material.dart';

class DemoHot extends StatefulWidget {
  DemoHot({Key? key}) : super(key: key);

  @override
  _DemoHotState createState() => _DemoHotState();
}

class _DemoHotState extends State<DemoHot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        height: 200,
        child: Text("热门", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
