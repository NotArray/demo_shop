import 'package:flutter/material.dart';

class DemoCategory extends StatefulWidget {
  DemoCategory({Key? key}) : super(key: key);

  @override
  _DemoCategoryState createState() => _DemoCategoryState();
}

class _DemoCategoryState extends State<DemoCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 80,
            height: 100,
            color: Colors.blue,
            child: Text(
              "分类${index + 1}",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
