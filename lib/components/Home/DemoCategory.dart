import 'package:demo_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class DemoCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  DemoCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  _DemoCategoryState createState() => _DemoCategoryState();
}

class _DemoCategoryState extends State<DemoCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: widget.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 195, 199, 202),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 40, height: 40),
                Text(
                  category.name,
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
