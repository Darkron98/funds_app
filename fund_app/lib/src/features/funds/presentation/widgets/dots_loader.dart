import 'package:flutter/material.dart';

class DotsLoader extends StatefulWidget {
  final double scale;
  const DotsLoader({
    super.key,
    required this.scale,
  });

  @override
  State<DotsLoader> createState() => _DotsLoaderState();
}

class _DotsLoaderState extends State<DotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _animationValue(int index) {
    final delay = index * 0.2;
    final value = (_controller.value - delay) % 1.0;
    return Curves.easeInOut.transform(value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final translateY = -10 * _animationValue(index);

            return Transform.translate(
              offset: Offset(0, translateY),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: super.widget.scale / 2),
                child: Container(
                  width: super.widget.scale,
                  height: super.widget.scale,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
