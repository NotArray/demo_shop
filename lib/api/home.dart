import 'package:demo_shop/constants/index.dart';
import 'package:demo_shop/utils/DioRequest.dart';
import 'package:demo_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

//获取分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

//获取热门商品列表
Future<Result> getProductListAPI() async {
  //返回请求
  return Result.fromJSON(await dioRequest.get(HttpConstants.PRODUCT_LIST));
}
