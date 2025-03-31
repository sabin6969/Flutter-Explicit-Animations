import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicator extends StatefulWidget {
  const AnimatedCircularProgressIndicator({super.key});

  @override
  State<AnimatedCircularProgressIndicator> createState() =>
      _AnimatedCircularProgressIndicatorState();
}

class _AnimatedCircularProgressIndicatorState
    extends State<AnimatedCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 710,
      ),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 2.1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInCirc,
      ),
    );

    _animationController.repeat(
      reverse: true,
    );
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
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.amber,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
