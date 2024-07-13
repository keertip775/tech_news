import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_news/views/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static String routeName = '/';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(const Duration(seconds: 3), () {
      Get.off(HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.jpg',
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
