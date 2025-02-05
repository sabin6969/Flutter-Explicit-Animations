import 'package:flutter/material.dart';
import 'dart:math' show sqrt;

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({super.key});

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong1,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _animationController,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return ClipPath(
                clipper: WaveClipper(
                  progress: _animation.value,
                ),
                child: Container(
                  color: Colors.blue,
                  height: size.height,
                  width: size.width,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController.status == AnimationStatus.completed) {
            // _animationController.reset();
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double progress;

  const WaveClipper({
    required this.progress,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    Offset center = Offset(size.width, size.height);

    double maxRadius =
        sqrt(size.width * size.width + size.height * size.height);

    double r = maxRadius * progress;

    path.addOval(
      Rect.fromCenter(
        center: center,
        width: r * 2,
        height: r * 2,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
