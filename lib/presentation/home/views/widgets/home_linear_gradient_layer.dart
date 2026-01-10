import 'package:flutter/material.dart';

class HomeLinearGradientLayer extends StatelessWidget {
  const HomeLinearGradientLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.onSecondary.withValues(alpha: 0.9),
              theme.colorScheme.onSecondary.withValues(alpha: 0.8),
              theme.colorScheme.onSecondary,
            ],
            stops: const [0, 0.47, 1],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
        ),
      ),
    );
  }
}
