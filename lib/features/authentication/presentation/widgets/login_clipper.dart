import 'package:flutter/material.dart';

class LoginCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.7); // Mulai dari kiri atas ke bawah
    
    // Titik Kontrol dan Titik Akhir untuk kurva melengkung ke atas
    var firstControlPoint = Offset(size.width / 4, size.height * 0.65);
    var firstEndPoint = Offset(size.width / 2, size.height * 0.75);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy
    );
    
    var secondControlPoint = Offset(size.width * 3 / 4, size.height * 0.85);
    var secondEndPoint = Offset(size.width, size.height * 0.78);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy
    );

    path.lineTo(size.width, size.height); // Garis lurus ke kanan bawah
    path.lineTo(size.width, 0); // Garis lurus ke kanan atas
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
