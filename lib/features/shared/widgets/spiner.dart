import 'dart:math' as math;
import 'package:flutter/material.dart';

class SpinningLoader extends StatefulWidget {
  final String assetPath;
  final double size;

  const SpinningLoader({
    super.key,
    required this.assetPath,
    this.size = 80,
  });

  @override
  State<SpinningLoader> createState() => _SpinningLoaderState();
}

class _SpinningLoaderState extends State<SpinningLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller.drive(Tween(begin: 0.0, end: 1.0)),
      child: Image.asset(
        widget.assetPath,
        height: widget.size,
        width: widget.size,
      ),
    );
  }
}
