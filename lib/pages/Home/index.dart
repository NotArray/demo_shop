import 'package:demo_shop/api/home.dart';
import 'package:demo_shop/components/Home/DemoCategory.dart';
import 'package:demo_shop/components/Home/DemoMoreList.dart';
import 'package:demo_shop/components/Home/DemoSlider.dart';
import 'package:demo_shop/components/Home/DemoHot.dart';
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
  List<CategoryItem> _categoryList = [];
  Result _productList = Result(id: "", title: "", subTypes: []);
  // 热榜推荐
  Result _inVogueResult = Result(id: "", title: "", subTypes: []);
  // 一站式推荐
  Result _oneStopResult = Result(id: "", title: "", subTypes: []);

  //获取滚动容器的内容
  List<Widget> _getScrollChildern() {
    return [
      //轮播图组件
      SliverToBoxAdapter(child: DemoSlider(bannerList: _bannerList)),
      //边距高度组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //横向分类组件
      SliverToBoxAdapter(child: DemoCategory(categoryList: _categoryList)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: DemoSuggestion(productList: _productList)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            // Expanded()均分
            Expanded(
              child: DemoHot(result: _inVogueResult, type: "hot"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: DemoHot(result: _oneStopResult, type: "step"),
            ),
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
    _getCategoryList();
    _getProductList();
    _getInVogueList();
    _getOneStopList();
  }

  //获取轮播图列表
  void _getBannderList() async {
    _bannerList = await getBannerListAPI();

    setState(() {});
  }

  //获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  //获取特惠商品列表
  void _getProductList() async {
    _productList = await getProductListAPI();
    setState(() {});
  }

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildern());
  }
}
