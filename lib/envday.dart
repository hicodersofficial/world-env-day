import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EnvDay extends StatefulWidget {
  const EnvDay({Key? key}) : super(key: key);

  @override
  State<EnvDay> createState() => _EnvDayState();
}

class _EnvDayState extends State<EnvDay> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF2FFEE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            height: height / 3,
            child: Stack(
              children: [
                Positioned(
                  top: -10,
                  right: -20,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 500),
                      child: Lottie.asset(
                        "assets/animations/windmill.json",
                        height: 250,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDown(
                          child: const Center(
                            child: Text(
                              "5 June",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        FadeInDown(
                          child: const Text(
                            "World",
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5513),
                            ),
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 700),
                          child: const Text(
                            "Environment",
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5513),
                            ),
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 1000),
                          child: const Text(
                            "Day",
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5513),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //   const SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset("assets/animations/earth.json",
                controller: _controller,
                repeat: false, onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.forward();
            }),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 1500),
            child: const Center(
              child: Text(
                "Theme 2022: Only One Earth",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3b5513),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
