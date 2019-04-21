import 'package:flutter/material.dart';
import "package:flutter_app/on_boarding/data.dart";
import "package:gradient_text/gradient_text.dart";
import "package:flutter_app/on_boarding/page_indicator.dart";

class BoardingApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BoardingAppState();
  }
}

class _BoardingAppState extends State<BoardingApp> with TickerProviderStateMixin {
  PageController _pageController;
  AnimationController animationController;
  Animation<double> _scaleAnim;
  int currentPage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff485563), Color(0xff29323c)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildPageView(),
            _buildIndicators(),
            _buildFloatButton(),
          ],
        ),
      ),
    );
  }

  PageView _buildPageView() {
    return PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        var page = pageList[index];

                        var delta;
                        var y = 1.0;

                        if (_pageController.position.haveDimensions) {
                          delta = _pageController.page - index;
                          y = 1 - delta.abs().clamp(0.0, 1.0);
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(page.imageUrl),
                            Container(
                              margin: EdgeInsets.only(left: 12.0),
                              height: 100.0,
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                          colors: page.titleGradient),
                                      style: TextStyle(
                                        fontSize: 80.0,
                                        fontFamily: "Montserrat-Black",
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    opacity: .10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30.0, left: 22.0),
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                          colors: page.titleGradient),
                                      style: TextStyle(
                                        fontSize: 70.0,
                                        fontFamily: "Montserrat-Black",
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, left: 34.0),
                              child: Transform(
                                child: Text(
                                  page.body,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "Montserrat-Medium",
                                    color: Color(0xFF909090),
                                  ),
                                ),
                                transform: Matrix4.translationValues(
                                    0.0, 50 * (1 - y), 0.0),
                              ),
                            )
                          ],
                        );
                      })
                ],
              );
            },
            itemCount: pageList.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
                if (currentPage == pageList.length - 1) {
                  lastPage = true;
                  animationController.forward();
                } else {
                  lastPage = false;
                }
              });
            },
          );
  }

  Positioned _buildIndicators() {
    return Positioned(
            left: 30.0,
            bottom: 35.0,
            child: Container(
              width: 160.0,
              child: PageIndicator(currentPage, pageList.length),
            ),
          );
  }

  Positioned _buildFloatButton() {
    return Positioned(
            right: 30.0,
            bottom: 30.0,
            child: ScaleTransition(
              child: lastPage
                  ? FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
                  : Container(),
              scale: _scaleAnim,
            ),
          );
  }
}
