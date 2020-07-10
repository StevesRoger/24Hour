import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  Paint _paint;

  CirclePainter({Color color = Colors.white}) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 2
      // Use [PaintingStyle.fill] if you want the circle to be filled.
      //..style = PaintingStyle.stroke;
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DummyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WTF"),),
      body: SafeArea(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
