import 'package:flutter/material.dart';

class InnerShadowPlaceOrderWidget extends StatelessWidget {
  final bool isCircle;
  final Widget childWidget;
  final Function() onTap;

  const InnerShadowPlaceOrderWidget({
    super.key,
    required this.isCircle,
    required this.childWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff459EAF),
              Color(0xff007991),
            ],
          ),
          borderRadius: isCircle ? null : BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: CustomPaint(
            painter: InnerShadowPainter(isCircle: isCircle),
            child: childWidget,
          ),
        ),
      ),
    );
  }
}

class InnerShadowPainter extends CustomPainter {
  final bool isCircle;

  InnerShadowPainter({required this.isCircle});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(
        rect, Radius.circular(isCircle ? size.width / 2 : 10));

    final shadowPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5)
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.black.withOpacity(0.2),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.saveLayer(rect, Paint());
    canvas.drawRRect(rrect, Paint()..color = Colors.black.withOpacity(0.2));
    canvas.drawRRect(rrect, shadowPaint);
    canvas.restore();

    final highlightPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3)
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff459EAF),
          Color(0xff007991),
        ],
      ).createShader(rect);

    canvas.saveLayer(rect, Paint());
    canvas.drawRRect(rrect, Paint()..color = Colors.transparent);
    canvas.drawRRect(rrect, highlightPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
