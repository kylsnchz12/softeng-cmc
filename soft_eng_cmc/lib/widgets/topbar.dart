import 'package:flutter/material.dart';
import 'package:soft_eng_cmc/widgets/frostedglass.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
            top: 60,
            left: 30,
            child: FrostedGlass(
                w: 60, h: 60, img: "assets/images/back_button.png")),
        Positioned(
          top: 60,
          right: 30,
          child: FrostedGlass(
            w: 60.00,
            h: 60.00,
            img: 'assets/images/plant.png',
          ),
        )
      ],
    );
  }
}
