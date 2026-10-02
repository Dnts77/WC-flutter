import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const ErrorIndicator({
  super.key, 
  required final String title,
  required final String label, 
  required final VoidCallback onPressed, 
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppDimens.edgeInsetsScreen,
        child: Column(
          mainAxisSize: .min,
          spacing: AppDimens.paddingVertical,
          children: [
            Text(title, textAlign: .center,), 
            FilledButton(
              onPressed: onPressed,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}