import 'package:demo_shop/constants/index.dart';
import 'package:demo_shop/utils/DioRequest.dart';
import 'package:demo_shop/viewmodels/home.dart';

Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodsDetailsItems.fromJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
