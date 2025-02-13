import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
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
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              if (_animationController.status == AnimationStatus.completed) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
            },
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                    _animationController.value * 20,
                  ),
                  child: Container(
                    height: 65,
                    width: _animation.value * size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: _animationController.status ==
                              AnimationStatus.completed
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                    ),
                    child: Center(
                      child: _animationController.status ==
                              AnimationStatus.completed
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Foo",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
