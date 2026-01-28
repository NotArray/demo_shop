//定义轮播图的具体类型
class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  //扩展一个工厂函数 用factory声明 用于创建实例对象
  factory BannerItem.formJSON(Map<String, dynamic> json) {
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
  //扩展一个工厂函数 用factory声明 用于创建实例对象
  factory CategoryItem.formJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] == null
          ? null
          : List<CategoryItem>.from(
              json["children"].map(
                (item) => CategoryItem.formJSON(item as Map<String, dynamic>),
              ),
            ).toList(),
    );
  }
}
