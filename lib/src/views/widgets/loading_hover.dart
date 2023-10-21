import 'package:flutter/material.dart';

class HoverLoading extends StatelessWidget {
  const HoverLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white.withOpacity(0.8),
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
