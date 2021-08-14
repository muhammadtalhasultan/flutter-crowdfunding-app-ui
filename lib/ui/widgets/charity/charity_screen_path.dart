import 'package:flutter/material.dart';

class CharityScreenPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.2415250, size.height * 0.0015000,
        size.width * 0.3250000, 0);
    path.cubicTo(
        size.width * 0.3736500,
        size.height * 0.0005000,
        size.width * 0.4234750,
        size.height * 0.4981000,
        size.width * 0.5000000,
        size.height * 0.5000000);
    path.cubicTo(
        size.width * 0.5793750,
        size.height * 0.5008000,
        size.width * 0.6183000,
        size.height * 0.0016000,
        size.width * 0.6750000,
        0);
    path.quadraticBezierTo(
        size.width * 0.7493500, size.height * 0.0024000, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
