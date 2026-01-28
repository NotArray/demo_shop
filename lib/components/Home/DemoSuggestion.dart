import 'package:demo_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class DemoSuggestion extends StatefulWidget {
  final Result productList;
  DemoSuggestion({Key? key, required this.productList}) : super(key: key);

  @override
  _DemoSuggestionState createState() => _DemoSuggestionState();
}

class _DemoSuggestionState extends State<DemoSuggestion> {
  //去前三条数据
  List<GoodsItem> _getDisplayItems() {
    return widget.productList.subTypes.first.goodsItems.items.take(3).toList();
  }

  Widget _buildeHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",

          style: TextStyle(
            color: const Color.fromARGB(171, 152, 26, 1),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(color: const Color.fromARGB(171, 181, 77, 56)),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              list[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),

            child: Text(
              "￥${list[index].price}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //padding边距包裹
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            //顶部内容
            _buildeHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
            //底部内容
          ],
        ),
      ),
    );
  }
}
