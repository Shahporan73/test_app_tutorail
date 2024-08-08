import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      return setState(() {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    var width =  MediaQuery.sizeOf(context).width;
    var height =  MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            height: height * 0.30,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children:<Widget> [
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,width: 100,
                  color: Colors.pink,
                ),
                Container(
                  height: 100,width: 100,
                  color: Colors.black,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                )
              ],
            ),
          ),

          10.heightBox,
          SmoothPageIndicator(
              controller: _pageController,
              count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.deepPurple,
              dotColor: Colors.deepPurple.shade100,
              dotHeight: 10,
              dotWidth: 10
            ),
          ),

        ],
      )
    );
  }
}
