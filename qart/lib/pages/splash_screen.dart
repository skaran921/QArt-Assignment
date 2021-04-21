import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _animation = Tween(begin: -2.0, end: 4.0).animate(_animationController!);

    _animationController!.repeat();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context, child) {
            return Transform.scale(
                scale: _animation!.value / 2,
                child: Image.asset("assets/images/logo.png"));
          },
        ),
      ),
    );
  }
}
