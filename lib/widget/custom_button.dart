import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? btnColor;
  final Color? txtColor;
  final EdgeInsets? padding;

  const CustomButton({
    required this.onPressed,
    required this.text,
    this.btnColor,
    this.txtColor,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: btnColor ?? const Color(0xFF1E3E62),
          foregroundColor: txtColor ?? const Color(0xFFBCCCDC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
          maximumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
