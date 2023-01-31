import 'package:flutter/material.dart';

class WaveHomeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    print(size.width.toString());
    Path path=Path();
    //start path =>P0
    path.lineTo(0, size.height);
    //first point of quadratic bezier curve => P1
    var firstStart=Offset(size.width/5, size.height);
    //second point of quadratic bezier curve => P2
    var firstEnd=Offset(size.width/2.25, size.height-50);
    //path method
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    //third point of quadratic bezier curve => P3
    var secondStart=Offset(size.width-(size.width/3.24), size.height-105);
    //fourth point of quadratic bezier curve => P4
    var secondEnd=Offset(size.width, size.height-10);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    //end with this path created
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
