import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';

class ProductShowcasePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    // Draw Gradient Background
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Gradient gradient = LinearGradient(
      colors: [Colors.blue.shade400, Colors.purple.shade400],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    paint.shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // Draw Top Wave
    paint.shader = null;
    paint.color = Apptheme.primary.withOpacity(0.3);
    Path wavePath = Path();
    wavePath.moveTo(0, size.height * 0.2);
    wavePath.quadraticBezierTo(size.width * 0.25, size.height * 0.15,
        size.width * 0.5, size.height * 0.2);
    wavePath.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.2);
    wavePath.lineTo(size.width, 0);
    wavePath.lineTo(0, 0);
    wavePath.close();
    canvas.drawPath(wavePath, paint);

    // Draw Bottom Spotlight Circle
    paint.color = Apptheme.primary.withOpacity(0.5);
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.8), size.width * 0.3, paint);

    // Draw Product Highlight Circle
    paint.color = Apptheme.primary.withOpacity(0.8);
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.5), size.width * 0.2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ProductShowcaseBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProductShowcasePainter(),
      child: Container(), // Add your product showcase content here
    );
  }
}
