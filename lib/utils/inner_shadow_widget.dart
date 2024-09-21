import 'package:flutter/material.dart';

class InnerShadowWidget extends StatelessWidget {
  final bool isCircle;
  final Widget childWidget;

  const InnerShadowWidget({
    super.key,
    required this.isCircle,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        color: Color(0xFFF1F1F1),
        borderRadius: isCircle ? null : BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: CustomPaint(
          painter: InnerShadowPainter(isCircle: isCircle),
          child: childWidget,
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
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5)
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.black.withOpacity(0.2),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.saveLayer(rect, Paint());
    canvas.drawRRect(rrect, Paint()..color = Colors.white);
    canvas.drawRRect(rrect, shadowPaint);
    canvas.restore();

    final highlightPaint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3)
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.3),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.saveLayer(rect, Paint());
    canvas.drawRRect(rrect, Paint()..color = Colors.white);
    canvas.drawRRect(rrect, highlightPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
