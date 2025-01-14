import 'package:animations/pages/bouncing_ball_page.dart';
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
