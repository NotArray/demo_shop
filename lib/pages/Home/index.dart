import 'package:demo_shop/api/home.dart';
import 'package:demo_shop/components/Home/DemoCategory.dart';
import 'package:demo_shop/components/Home/DemoMoreList.dart';
import 'package:demo_shop/components/Home/DemoSlider.dart';
import 'package:demo_shop/components/Home/DemoHot.dart';
import 'package:demo_shop/components/Home/DemoSuggestion.dart';
import 'package:demo_shop/utils/ToastUtils.dart';
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
  final ScrollController _controller = ScrollController();
  // 推荐列表
  List<GoodDetailItem> _recommendList = [];
  //获取滚动容器的内容

  //定义滚动判断数据
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  //定义首次刷新
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  //定义首次刷新的边距
  double _paddingTop = 0;

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
      DemoMoreList(recommendList: _recommendList), // 无限滚动列表
    ];
  }

  @override
  void initState() {
    super.initState();
    _registerEvent();
    Future.microtask(() {
      _paddingTop = 100;
      setState(() {});
      _key.currentState?.show();
    });
  }

  //获取轮播图列表
  Future<void> _getBannderList() async {
    _bannerList = await getBannerListAPI();
  }

  //获取分类列表
  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
  }

  //获取特惠商品列表
  Future<void> _getProductList() async {
    _productList = await getProductListAPI();
  }

  // 获取热榜推荐列表
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
  }

  // 获取一站式推荐列表
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
  }

  // 获取推荐列表
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) return;
    int requestLimit = _page * 10;
    _isLoading = true;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false;
    setState(() {});
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  //监听滚动事件
  void _registerEvent() {
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 100) {
        _getRecommendList();
      }
    });
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    await _getBannderList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    Toastutils.showToast(context, "刷新成功");
    _paddingTop = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(milliseconds: 300),
        child: CustomScrollView(
          controller: _controller, //绑定滚动关系
          slivers: _getScrollChildern(),
        ),
      ),
    );
  }
}
