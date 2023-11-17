
import 'package:flutter/material.dart';


class MovingImagesWidget extends StatefulWidget {
  const MovingImagesWidget({super.key});

  @override
  State createState() => _MovingImagesWidgetState();
}
//
class _MovingImagesWidgetState extends State<MovingImagesWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
      const Duration(
          seconds: 4),
    )
      ..forward();
   }





  Widget buildAnimatedImage(
      double initialTop,
      double initialLeft,
      double initialRight,
      double directionMultiplierHorizontal,
      double directionMultiplierVertical,
      String imagePath,
      double widthImage,
      double heightImage,
      )
  {
    return Positioned(
      top: initialTop,
      left: initialLeft,
      right: initialRight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final curvedAnimation = CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          );
          final mediaQuery = MediaQuery.of(context);
          final horizontalOffset = directionMultiplierHorizontal * curvedAnimation.value * (mediaQuery.size.width - mediaQuery.padding.left);
          final verticalOffset = (directionMultiplierVertical - curvedAnimation.value) * (mediaQuery.size.height - mediaQuery.viewPadding.top);
          final scale = curvedAnimation.value > 1.0 ? 0.7 : curvedAnimation.value;
          return Transform.translate(
            offset: Offset(horizontalOffset, verticalOffset),
            child: Transform.scale(
              scale: scale,
              child: Image.asset(
                imagePath,
                width: widthImage,
                height: heightImage,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/start.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: mediaQuery.viewPadding.top + kToolbarHeight * 1.2,
          child: SizedBox(
            width: mediaQuery.size.width,
            child: const Text(
              "NONOGRAMS",
              style: TextStyle(
                fontFamily: 'YOUR_LOVER',
                color: Color(0xFF5E6AC0),
                fontSize: 30.0,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          top: mediaQuery.viewPadding.top + kToolbarHeight * 1.8,
          child: SizedBox(
            width: mediaQuery.size.width,
            child: const Text(
              "JAPANESE CROSSWORDS ",
              style: TextStyle(
                fontFamily: 'YOUR_LOVER',
                color: Color(0xFF5E6AC0),
                fontSize: 16.0,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          bottom: mediaQuery.viewPadding.bottom + kToolbarHeight * 1.2,
          child: SizedBox(
            width: mediaQuery.size.width,
            child: const Text(
              "WELCOME",
              style: TextStyle(
                fontFamily: 'YOUR_LOVER',
                color: Color(0xFF5E6AC0),
                fontSize: 40.0,
                decoration: TextDecoration.none,
                shadows: [
                  Shadow(
                    color: Color(0xFF9e91a5),
                    offset: Offset(3.0, 3.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        buildAnimatedImage(
          -3 * mediaQuery.viewPadding.top - kToolbarHeight,
          0,
          0,
          -0.5,
          1.0,
          'assets/images/flower1.png',
          mediaQuery.size.width,
          mediaQuery.size.width,
        ),
        buildAnimatedImage(
          mediaQuery.size.height / 2.2,
          0,
          0,
          -0.5,
          1.0,
          'assets/images/flower1.png',
          mediaQuery.size.width,
          mediaQuery.size.width,
        ),
        buildAnimatedImage(
          mediaQuery.size.height / 2,
          -8,
          0,
          -0.5,
          1.0,
          'assets/images/flower2.png',
          mediaQuery.size.width * 0.8,
          mediaQuery.size.width * 0.8,
        ),
        buildAnimatedImage(
          -2 * mediaQuery.viewPadding.top - kToolbarHeight,
          0,
          0,
          0.5,
          1.0,
          'assets/images/flower2.png',
          mediaQuery.size.width * 0.8,
          mediaQuery.size.width * 0.8,
        ),
        buildAnimatedImage(
          mediaQuery.size.height / 2.2,
          0,
          0,
          0.4,
          1.0,
          'assets/images/flower4.png',
          mediaQuery.size.width * 0.6,
          mediaQuery.size.width * 0.6,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MONOGRAMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovingImagesWidget(),
    );
  }
}

