import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DeadlineAnimation extends StatefulWidget {
  const DeadlineAnimation({super.key});

  @override
  State<DeadlineAnimation> createState() => _DeadlineAnimationState();
}

class _DeadlineAnimationState extends State<DeadlineAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 10,
      ),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset(2, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
      ),
    );

    _animationController.forward();

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
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 85,
              child: SlideTransition(
                position: _slideAnimation,
                child: Lottie.asset(
                  "assets/lottie/ghost_animation.json",
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return LinearProgressIndicator(
                        value: _animation.value,
                        minHeight: 15,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
