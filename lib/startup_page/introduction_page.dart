import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../pages/startup_page.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}
class _IntroPageState extends State<IntroPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntroductionScreen(
          key: _introKey,
          // pages: [...PageModel],
          pages: [
            PageViewModel(
              titleWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _introKey.currentState?.next();
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                color: Color(0xff6CC51D),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const Text('Welcome to',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                  Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 200,
                      child: const Image(
                          image: AssetImage('assets/intro/img_1.png'))),
                ],
              ),
              body:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              image: const Image(
                  image: AssetImage('assets/intro/img_5.png')),
              decoration: editPageDecoration(),
              reverse: true,
            ),
            PageViewModel(
              titleWidget: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _introKey.currentState?.previous();
                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              color: Color(0xff6CC51D),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _introKey.currentState?.next();
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              color: Color(0xff6CC51D),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                ),
                const Text(
                  'Buy Quality',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const Text(
                  'Dairy Products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                )
              ]),
              body:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              image: const Image(
                  image: AssetImage('assets/intro/img_2.png'),fit: BoxFit.cover),
              decoration: editPageDecoration(),
              reverse: true,
            ),
            PageViewModel(
              titleWidget: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _introKey.currentState?.previous();
                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              color: Color(0xff6CC51D),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _introKey.currentState?.next();
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              color: Color(0xff6CC51D),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                ),
                const Text(
                  'Buy Premium',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const Text(
                  'Quality Fruits',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                )
              ]),
              body:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              image: const Image(
                  image: AssetImage('assets/intro/img_3.png')),
              decoration: editPageDecoration(),
              reverse: true,
            ),
            PageViewModel(
              titleWidget: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, StartupPage.id);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xff6CC51D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ]),
                ),
                const Text(
                  'Get Discount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const Text(
                  'On All Products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                )
              ]),
              body:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              image: const Image(
                  image: AssetImage('assets/intro/img_4.png')),
              decoration: editPageDecoration(),
              reverse: true,
            ),
          ],
          dotsDecorator: editDotsDecorator(),
          showNextButton: false,
          showBackButton: false,
          showDoneButton: false,
        ),
      ],
    );
  }
}

DotsDecorator editDotsDecorator() => const DotsDecorator(
  activeColor: Color(0xff6CC51D),
  spacing: EdgeInsets.symmetric(horizontal: 2, vertical: 100),
  size: Size(6, 6),
);
PageDecoration editPageDecoration() {
  return const PageDecoration(
    // titlePadding: EdgeInsets.only(top: 0, bottom: 20, right: 30, left: 30),
    bodyPadding: EdgeInsets.symmetric(horizontal: 30,),
    bodyTextStyle: TextStyle(color: Colors.black54),
    imageAlignment: Alignment.topCenter,
    bodyAlignment: Alignment.topCenter,
    fullScreen: true,
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
    imagePadding: EdgeInsets.zero,
  );
}
