import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String texto;
  final TextAlign? align;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double letterSpacing;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  const TextWidget(
    this.texto, {
    super.key,
    this.align = TextAlign.left,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: align,
      style: TextStyle(
        letterSpacing: letterSpacing,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
    );
  }
}
