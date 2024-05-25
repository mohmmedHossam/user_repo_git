import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class TextView extends StatelessWidget {
  final bool multiLan;
  final String text;
  TextStyle? style;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxline;

  TextView({Key? key , required this.multiLan , required this.text , this.style, this.textAlign,this.maxline , this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(multiLan ? Locales.string(context, text) : text , style: style,textAlign: textAlign,
      maxLines: maxline,
      overflow: overflow,
    );
  }
}
