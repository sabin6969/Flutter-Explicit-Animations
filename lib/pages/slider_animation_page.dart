import 'package:flutter/material.dart';

class SliderAnimation extends StatefulWidget {
  const SliderAnimation({super.key});

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(
        0.0,
        2.5,
      ),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInCirc,
      ),
    );

    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/flutter_logo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
