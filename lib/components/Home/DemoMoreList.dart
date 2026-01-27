import 'package:flutter/material.dart';

class DemoMorelist extends StatefulWidget {
  DemoMorelist({Key? key}) : super(key: key);

  @override
  _DemoMorelistState createState() => _DemoMorelistState();
}

class _DemoMorelistState extends State<DemoMorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //二列网格
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          height: 300,
          alignment: Alignment.center,
          child: Text(
            "商品",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
    );
  }
}
