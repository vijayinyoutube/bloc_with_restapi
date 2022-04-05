import 'package:flutter/material.dart';

class TextBuilder extends StatelessWidget {
  final String textMsg;
  final TextStyle textStyle;

  final TextAlign textAlign;

  const TextBuilder(
      {Key? key,
      required this.textMsg,
      this.textStyle = const TextStyle(color: Colors.black, fontSize: 22.00),
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textMsg,
      textAlign: textAlign,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 100,
    );
  }
}
