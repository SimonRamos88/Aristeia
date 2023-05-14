import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomGradient extends CustomPainter {
  CustomGradient({
    required this.gradient,
    required this.sWidth,
    required this.bRadius,
  });

  final Gradient gradient;
  final double sWidth;
  final Paint p = Paint();

  final double bRadius;

  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(
        sWidth, sWidth, size.width - sWidth, size.height - sWidth);
    Rect outerRect = Offset.zero & size;

    RRect innerRoundedRect =
        RRect.fromRectAndRadius(innerRect, Radius.circular(bRadius));
    RRect outerRoundedRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(bRadius));

    p.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);
    canvas.drawPath(borderPath, p);
  }

  Path _calculateBorderPath(RRect outerRect, RRect innerRect) {
    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath = Path()..addRRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CustomGradientContainer extends StatelessWidget {
  CustomGradientContainer({
    super.key,
    required gradient,
    required this.child,
    this.strokeWidth = 0,
    this.bRadius = 1,
    this.padding = 12,
  }) : this.painter = CustomGradient(
          gradient: gradient,
          sWidth: strokeWidth,
          bRadius: bRadius,
        );

  final CustomGradient painter;
  final Widget child;
  final double strokeWidth;
  final double bRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: painter, child: child);
  }
}

class MyButton extends StatelessWidget {
  static final gradients = AppGradients();
  static final colors = AppColors();

  final String buttonText;
  final double width;
  final double shadow;
  final LinearGradient backgroundGradient;
  final LinearGradient borderGradient;
  final Color colorText;
  final bool outlined;
  final bool large;
  final bool blue;
  final bool pink;
  final Function()? onTap;

  const MyButton({
    Key? key,
    this.outlined = false,
    this.large = true,
    this.buttonText = '',
    this.width = 200,
    this.shadow = 0,
    this.blue = false,
    this.pink = false,
    this.backgroundGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6D4CE4),
        Color(0xff6D4CE4),
        Color.fromRGBO(109, 76, 228, 0.75),
      ],
      stops: [0.0, 0.01, 1.0],
    ),
    this.borderGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6D4CE4),
        Color(0xff6D4CE4),
        Color.fromRGBO(109, 76, 228, 0.75),
      ],
      stops: [0.0, 0.01, 1.0],
    ),
    this.colorText = Colors.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Background button
      child: Container(
        margin: large
            ? const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
            : null,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: outlined
              ? null
              : blue
                  ? gradients.blueGradient
                  : pink
                      ? gradients.pinkGradient
                      : backgroundGradient,
          //gradient: backgroundGradient,
          border: Border.all(
            color: outlined
                ? blue
                    ? colors.blueColor
                    : pink
                        ? colors.pinkColor
                        : Theme.of(context).primaryColor
                : pink
                    ? colors.pinkColor.withOpacity(0.3)
                    : const Color.fromRGBO(109, 76, 228, 0.329),
            width: 3,
            //strokeAlign: BorderSide.strokeAlignOutside
          ),
        ),
        // Gradient border
        // child: CustomGradientContainer(
        //   bRadius: 20,
        //   gradient: outlined
        //       ? const LinearGradient(
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //           colors: [
        //             Colors.white,
        //             Colors.white,
        //           ],
        //         )
        //       : borderGradient,
        //   strokeWidth: outlined ? 25 : 0,
        // Button content
        child: Material(
          color: Colors.transparent,
          elevation: shadow,
          // Widget border
          borderRadius: BorderRadius.circular(22),
          // Splash animation when the button is clicked
          child: InkWell(
            // focusColor: Colors.transparent,
            // hoverColor: Colors.transparent,
            // highlightColor: Colors.transparent,
            onTap: onTap,
            splashColor: const Color.fromRGBO(109, 76, 228, 0.85),
            // Animation border
            borderRadius: BorderRadius.circular(22),
            child: Container(
              padding:
                  large ? null : const EdgeInsets.symmetric(horizontal: 24),
              // Size widget
              alignment: Alignment.center,
              height: 48,
              //margin: EdgeInsets.symmetric(horizontal: 20),
              width: large ? null : width,

              child: Text(buttonText,
                  style: heading3bStyle.copyWith(
                    color: (outlined && colorText == Colors.white)
                        ? blue
                            ? colors.blueColor
                            : pink
                                ? colors.pinkColor
                                : Theme.of(context).primaryColor
                        : colorText,
                  )),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
