import 'package:flutter/material.dart';

class FavouriteAnimation extends StatefulWidget {
  const FavouriteAnimation({super.key});

  @override
  State<FavouriteAnimation> createState() => _FavouriteAnimationState();
}

class _FavouriteAnimationState extends State<FavouriteAnimation>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.7,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInExpo,
      ),
    );

    _animationController.addListener(
      () {
        if (_animationController.status == AnimationStatus.completed) {
          isLiked = !isLiked;
          setState(() {});
          _animationController.reverse();
        }
      },
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
              child: IconButton(
                onPressed: () {
                  _animationController.forward();
                },
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_outline,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
