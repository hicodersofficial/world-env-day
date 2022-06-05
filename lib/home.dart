import 'package:animate_do/animate_do.dart';
import 'package:envday/envday.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isShowingSplash = true;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
    );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        setState(() {
          _isShowingSplash = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowingSplash) {
      return const SafeArea(
        child: EnvDay(),
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2FFEE),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/animations/tree2.json",
              repeat: false,
              controller: _controller,
              onLoaded: (composition) {
                _controller.duration =
                    composition.duration - const Duration(milliseconds: 500);
                _controller.forward();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: const Center(
                child: Text(
                  "@hi.coders",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
