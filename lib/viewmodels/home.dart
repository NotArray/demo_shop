//定义轮播图的具体类型
class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 修正：formJSON → fromJSON
  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}

//flutter没有隐式转化
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  // 修正：formJSON → fromJSON
  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] == null
          ? null
          : List<CategoryItem>.from(
              json["children"].map(
                // 修正内部调用：formJSON → fromJSON
                (item) => CategoryItem.fromJSON(item as Map<String, dynamic>),
              ),
            ).toList(),
    );
  }
}

// 根据特惠推荐.JSON生成的类型
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  // 保留正确的 fromJSON（无需改）
  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"],
      price: json["price"] ?? "",
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  // 保留正确的 fromJSON（无需改）
  factory GoodsItems.fromJSON(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: json["items"] == null
          ? []
          : List<GoodsItem>.from(
              json["items"].map(
                (item) => GoodsItem.fromJSON(item as Map<String, dynamic>),
              ),
            ).toList(),
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  // 保留正确的 fromJSON（无需改）
  factory SubType.fromJSON(Map<String, dynamic> json) {
    return SubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: GoodsItems.fromJSON(json["goodsItems"] ?? {}),
    );
  }
}

class Result {
  String id;
  String title;
  List<SubType> subTypes;

  Result({required this.id, required this.title, required this.subTypes});

  // 保留正确的 fromJSON（无需改）
  factory Result.fromJSON(Map<String, dynamic> json) {
    return Result(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: json["subTypes"] == null
          ? []
          : List<SubType>.from(
              json["subTypes"].map(
                (item) => SubType.fromJSON(item as Map<String, dynamic>),
              ),
            ).toList(),
    );
  }
}
