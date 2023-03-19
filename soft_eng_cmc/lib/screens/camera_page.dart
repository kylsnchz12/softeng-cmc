import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
//import 'package:soft_eng_cmc/widgets/topbar.dart';

import '../widgets/frostedglass.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.cameraController});
  final CameraController? cameraController;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        (widget.cameraController == null)
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
              )
            : SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        width: 100,
                        child: CameraPreview(widget.cameraController!)))),
        //const TopBar(),
        Stack(
          children: [
            Positioned(
              top: 60,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  dispose();
                  Navigator.pop(context);
                },
                child: const FrostedGlass(
                    w: 60, h: 60, img: "assets/images/back_button.png"),
              ),
            ),
            const Positioned(
              top: 60,
              right: 30,
              child: FrostedGlass(
                w: 60.00,
                h: 60.00,
                img: 'assets/images/plant.png',
              ),
            )
          ],
        ),
        Positioned(
          bottom: 40,
          child: Row(
            children: [
              const FrostedGlass(
                  w: 65.00, h: 65.00, img: 'assets/images/menu2.png'),
              const SizedBox(width: 37),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        builder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: CustomPaint(
                                  child: CustomPaint(
                                    size: const Size(50, 50),
                                    painter: LinePainter(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 30, right: 30, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/check.png',
                                          scale: 12,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "Compostable",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: const [
                                        SizedBox(height: 5),
                                        Text(
                                          "This item is compostable",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    const Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: const FrostedGlass(
                      w: 95.00,
                      h: 95.00,
                      img: 'assets/images/camera_button2.png'),
                ),
              ),
              const SizedBox(width: 37),
              const FrostedGlass(
                  w: 65.00, h: 65.00, img: 'assets/images/setting2.png'),
            ],
          ),
        )
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(255, 198, 197, 197)
      ..strokeWidth = 5;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
