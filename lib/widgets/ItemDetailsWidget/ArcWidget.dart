import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);
    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ArcWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      home: Scaffold(
        body: ClipPath(
          clipper: CurveClipper(),
          child: Container(
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );

  }
}
