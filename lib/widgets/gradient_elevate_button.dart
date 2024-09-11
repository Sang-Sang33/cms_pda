import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  GradientElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.linearGradient,
    borderRadius,
  }) : borderRadius = borderRadius ?? BorderRadius.circular(5);

  final Widget child;
  final VoidCallback onPressed;
  final LinearGradient linearGradient;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ElevatedButton has default 5 padding on top and bottom
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      // DecoratedBox contains our linear gradient
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: linearGradient,
          // Round the DecoratedBox to match ElevatedButton
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          // Duplicate the default styling of an ElevatedButton
          style: ElevatedButton.styleFrom(
            // Enables us to see the BoxDecoration behind the ElevatedButton
            backgroundColor: Colors.transparent,
            // Fits the Ink in the BoxDecoration
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ).merge(
            const ButtonStyle(
              // Elevation declared here so we can cover onPress elevation
              // Declaring in styleFrom does not allow for MaterialStateProperty
              elevation: WidgetStatePropertyAll(0),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
