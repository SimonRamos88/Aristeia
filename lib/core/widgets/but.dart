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
    Rect innerRect = Rect.fromLTRB(sWidth, sWidth, size.width - sWidth, size.height - sWidth);
    Rect outerRect = Offset.zero & size;

    RRect innerRoundedRect = RRect.fromRectAndRadius(innerRect, Radius.circular(bRadius));
    RRect outerRoundedRect = RRect.fromRectAndRadius(outerRect, Radius.circular(bRadius));

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
    @required gradient,
    required this.child,
    this.strokeWidth = 0,
    this.bRadius = 1,
    this.padding=12,
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
    return CustomPaint(
        painter: painter, 
        child: child
    );
  }
}

class MyBut extends StatelessWidget {
  const MyBut({
      Key? key,
      required this.buttonText,
      this.width = 200,
      this.height = 50,
      this.shadow = 0,
      this.borderRadius = 0,
      this.backgroundGradient = const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
      this.borderGradient = const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.yellow,
                Colors.red,
              ],
            ),
      this.splashColor = const Color.fromARGB(255, 0, 0, 0),
      this.colorText = const Color.fromARGB(255, 0, 0, 0),
      this.fontSize = 15,
      this.strokeWidth = 0,
      this.onTap,
    }) : super(key: key); 

  final String buttonText;
  final double width;
  final double height;
  final double shadow;
  final double borderRadius; 
  final LinearGradient backgroundGradient;
  final LinearGradient borderGradient;
  final double strokeWidth;
  final Color splashColor;
  final Color colorText;
  final double fontSize;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      // Background button
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: backgroundGradient,
        ),
        // Gradient border
        child: CustomGradientContainer(
          bRadius: borderRadius,
          gradient: borderGradient,
          strokeWidth: strokeWidth,
          // Button content
          child: Material(
            color: Colors.transparent,
            elevation: shadow, 
            // Widget border
            borderRadius: BorderRadius.circular(borderRadius),
            // Splash animation when the button is clicked
            child: InkWell(
              onTap: onTap,
              splashColor: splashColor,
              // Animation border
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                // Size widget
                height: height,
                width: width,
                child: Row(
                  children: [
                    // Text resizable
                    Expanded(
                      child:Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: colorText,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    )
                  ],
                )
              )
            ),
          ),
        ), 
      ),
    );
  }
}
