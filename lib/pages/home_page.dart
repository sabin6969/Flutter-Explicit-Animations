import 'package:animations/pages/bouncing_ball_page.dart';
import 'package:animations/pages/rotating_box_page.dart';
import 'package:animations/pages/slider_animation_page.dart';
import 'package:animations/pages/spinning_arc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explicit Animations",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                context.navigateToNextPage(
                  BouncingBallPage(),
                );
              },
              child: const Text(
                "Bouncing Ball",
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.navigateToNextPage(
                RoatatingBoxPage(),
              );
            },
            child: const Text(
              "Rotating Box",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpinningArc(),
                ),
              );
            },
            child: const Text(
              "Spinning Arc",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SliderAnimation(),
                ),
              );
            },
            child: const Text(
              "Sliding Logo",
            ),
          )
        ],
      ),
    );
  }
}

extension NavigationExtension on BuildContext {
  void navigateToNextPage(Widget nextPage) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }
}
