import 'package:demo_shop/pages/Cart/index.dart';
import 'package:demo_shop/pages/Category/index.dart';
import 'package:demo_shop/pages/Home/index.dart';
import 'package:demo_shop/pages/Mine/index.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "text": "主页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];
  int _currentIndex = 0;
  List<BottomNavigationBarItem> getTabBarWidge() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeArea避开安全区组件
      body: SafeArea(
        child: IndexedStack(children: _getChildren(), index: _currentIndex),
      ),

      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.blueGrey,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        items: getTabBarWidge(),
        currentIndex: _currentIndex,
      ),
    );
  }
}
