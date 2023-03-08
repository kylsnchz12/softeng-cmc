import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass(
      {super.key, required this.w, required this.h, required this.img});

  final double w;
  final double h;
  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: w,
        height: h,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05)
                      ])),
            ),
            Center(
              child: Image.asset(
                img,
                width: w,
                height: h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
