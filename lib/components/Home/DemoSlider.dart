import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class DemoSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  DemoSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _DemoSliderState createState() => _DemoSliderState();
}

//获取轮播图
class _DemoSliderState extends State<DemoSlider> {
  //CarouselSlider插件的controller
  CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;
  Widget _getSlider() {
    //每次查询获取屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      //绑定controller
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      //默认比例是0.8
      options: CarouselOptions(
        viewportFraction: 1,
        //打开自动播放
        autoPlay: true,
        //切换事件为5s
        autoPlayInterval: Duration(seconds: 5),
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  //获取搜索框
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  //获取指示灯
  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: index == _currentIndex ? 40 : 25,
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
