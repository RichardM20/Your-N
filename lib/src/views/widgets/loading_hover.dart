import 'package:flutter/material.dart';

class HoverLoading extends StatelessWidget {
  const HoverLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white.withOpacity(0.8),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
          backgroundColor: Colors.white,
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
