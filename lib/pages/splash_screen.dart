import 'dart:async';

import 'package:cashrich_demo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _textAnimationController;
  late Animation<Offset> _textAnimation;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _textAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _logoAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(_logoAnimationController);
    _textAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(_textAnimationController);
    _logoAnimationController.forward();
    _textAnimationController.forward();

    Timer(const Duration(milliseconds: 1500), () {
      Get.offAll(
        () => const HomePage(),
        transition: Transition.zoom,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: const Color(0xff363333),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _logoAnimation,
              child: Image.asset(
                "assets/cashrich_logo.png",
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeTransition(
              opacity: _logoAnimation,
              child: SlideTransition(
                position: _textAnimation,
                child: Image.asset(
                  "assets/text_logo.png",
                  height: 50,
                  width: double.maxFinite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
