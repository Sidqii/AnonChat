import 'package:flutter/material.dart';

class CustomPanel extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? page;
  final String text;
  final Color? txtColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? txtAlign;
  final MainAxisAlignment? alignment;
  final double? letterSpacing;

  const CustomPanel({
    required this.text,
    this.onTap,
    this.page,
    this.txtColor,
    this.fontSize,
    this.fontWeight,
    this.txtAlign,
    this.alignment,
    this.letterSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page!,
            ),
          );
        }
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: txtAlign ?? TextAlign.center,
              style: TextStyle(
                color: txtColor ?? Color(0xFFBCCCDC),
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.normal,
                letterSpacing: letterSpacing ?? 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
