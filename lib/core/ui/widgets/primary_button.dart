import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.minimumWidth = double.infinity,
    this.minimumHeight = 55,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final double minimumWidth;
  final double minimumHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(minimumWidth, minimumHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
