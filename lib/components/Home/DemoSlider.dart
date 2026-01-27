import 'package:flutter/material.dart';

class DemoSlider extends StatefulWidget {
  DemoSlider({Key? key}) : super(key: key);

  @override
  _DemoSliderState createState() => _DemoSliderState();
}

class _DemoSliderState extends State<DemoSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("轮播图位置", style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
