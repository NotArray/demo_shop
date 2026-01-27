import 'package:flutter/material.dart';

class DemoSuggestion extends StatefulWidget {
  DemoSuggestion({Key? key}) : super(key: key);

  @override
  _DemoSuggestionState createState() => _DemoSuggestionState();
}

class _DemoSuggestionState extends State<DemoSuggestion> {
  @override
  Widget build(BuildContext context) {
    //padding边距包裹
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        height: 300,
        color: Colors.blue,
        child: Text("推荐", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
