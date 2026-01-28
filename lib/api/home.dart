import 'package:demo_shop/constants/index.dart';
import 'package:demo_shop/utils/DioRequest.dart';
import 'package:demo_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

//获取分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

//获取热门商品列表
Future<Result> getProductListAPI() async {
  //返回请求
  return Result.fromJSON(await dioRequest.get(HttpConstants.PRODUCT_LIST));
}

// 热榜推荐
Future<Result> getInVogueListAPI() async {
  // 返回请求
  return Result.fromJSON(await dioRequest.get(HttpConstants.IN_VOGUE_LIST));
}

// 一站式推荐
Future<Result> getOneStopListAPI() async {
  // 返回请求
  return Result.fromJSON(await dioRequest.get(HttpConstants.ONE_STOP_LIST));
}
