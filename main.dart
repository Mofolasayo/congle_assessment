import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(padding: EdgeInsets.all(32.0), child: SquareAnimation()),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() => SquareAnimationState();
}

class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 50.0;

  Alignment _alignment = Alignment.center;
  bool _isAnimating = false;

  void _moveRight() {
    setState(() {
      _isAnimating = true;
      _alignment = Alignment.centerRight;
    });
  }

  void _moveLeft() {
    setState(() {
      _isAnimating = true;
      _alignment = Alignment.centerLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedAlign(
            alignment: _alignment,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            onEnd: () {
              setState(() {
                _isAnimating = false;
              });
            },
            child: Container(
              width: _squareSize,
              height: _squareSize,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  (_isAnimating || _alignment == Alignment.centerLeft)
                      ? null
                      : _moveLeft,
              child: const Text('To Left'),
            ),
            const SizedBox(width: 8),

            ElevatedButton(
              onPressed:
                  (_isAnimating || _alignment == Alignment.centerRight)
                      ? null
                      : _moveRight,
              child: const Text('To Right'),
            ),
          ],
        ),
      ],
    );
  }
}
