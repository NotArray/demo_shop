import 'package:demo_shop/api/home.dart';
import 'package:demo_shop/components/Home/DemoCategory.dart';
import 'package:demo_shop/components/Home/DemoHot.dart';
import 'package:demo_shop/components/Home/DemoMoreList.dart';
import 'package:demo_shop/components/Home/DemoSlider.dart';
import 'package:demo_shop/components/Home/DemoSuggestion.dart';
import 'package:demo_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [];

  //获取滚动容器的内容
  List<Widget> _getScrollChildern() {
    return [
      //轮播图组件
      SliverToBoxAdapter(child: DemoSlider(bannerList: _bannerList)),
      //边距高度组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //横向分类组件
      SliverToBoxAdapter(child: DemoCategory()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: DemoSuggestion()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            // Expanded()均分
            Expanded(child: DemoHot()),
            SizedBox(width: 10),
            Expanded(child: DemoHot()),
          ],
        ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 10)),
      DemoMorelist(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannderList();
  }

  void _getBannderList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildern());
  }
}
