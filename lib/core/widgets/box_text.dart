import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import 'package:flutter/material.dart';

class BoxText extends StatelessWidget {
  static final colors = AppColors();

  final String text;
  final TextStyle style;
  final EdgeInsets padding;
  final Color color;
  final bool centered;

  BoxText.tituloPagina(
      {super.key,
      this.text = '',
      this.color = Colors.black,
      this.centered = true})
      : style = heading1Style.copyWith(color: color),
        padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16);

  BoxText.section(
      {super.key,
      this.text = '',
      this.color = Colors.black,
      this.centered = true})
      : style = heading2bStyle.copyWith(color: color, fontSize: 20),
        padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
  // const BoxText.span(this.text) : style = spanStyle;

  // BoxText.body(this.text, {Color color = const Color(0xffED7D43)})
  //     : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors. green,
      width: MediaQuery.of(context).size.width,
      alignment: centered ? Alignment.center : Alignment.centerLeft,
      padding: padding,
      child: Text(
        textAlign: centered ? TextAlign.center : TextAlign.start,
        softWrap: true,
        text,
        style: style,
      ),
    );
  }
}
