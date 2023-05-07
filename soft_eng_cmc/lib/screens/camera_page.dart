import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'loading.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_camera_ml/predictor.dart';
//import 'package:soft_eng_cmc/widgets/topbar.dart';

import '../widgets/frostedglass.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.cameraController});
  final CameraController? cameraController;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? pictureFile;
  String message = '';
  bool resultCall = false;
  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }

  Future<String> uploadImage(File imageFile) async {
    var stream = http.ByteStream(imageFile.openRead());
    stream.cast();
    var length = await imageFile.length();

    var uri = Uri.parse('https://63a5-110-54-230-32.ngrok-free.app/upload');
    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('files', stream, length,
        filename: imageFile.path.split("/").last);
    request.files.add(multipartFile);

    var completer = Completer<String>();

    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image uploaded successfully");
    } else {
      print("Error uploading image");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      final decoded = json.decode(value);
      final message = decoded['message'];

      if (message == "BIO") {
        print(message);
        resultCall = true;
        completer.complete("Success");
      } else {
        resultCall = false;
        print(message);
        completer.complete("Error");
      }
    });

    return completer.future;
  }

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
                  dispose;
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
                  onTap: () async {
                    show();
                    if (_isLoading) {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    pictureFile = await widget.cameraController?.takePicture();

                    File imageFile = File(pictureFile!.path);

                    String result = await uploadImage(imageFile);
                    hide();
                    print(result);

                    if (resultCall == true) {
                      print("here on resultCall true");
                      // ignore: use_build_context_synchronously
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        "This item is compostable and can be broken down into nutrient-rich soil through industrial composting facilities. Please dispose of this item in your local industrial composting facility or in your own backyard compost bin to reduce waste and nourish the soil. Note: Do not dispose of this item in your regular trash as it will not break down in a landfill.",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    } else {
                      print("here on else");
                      // ignore: use_build_context_synchronously
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          // Image.asset(
                                          //   'assets/images/check.png',
                                          //   scale: 12,
                                          // ),
                                          // SizedBox(width: 5),
                                          Text(
                                            "Non Compostable",
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
                                            "This item is not compostable",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      const Text(
                                        "This item is not compostable and cannot be broken down into nutrient-rich soil. Please dispose of this item in your regular trash. Note: Do not attempt to compost this item in your backyard compost bin or dispose of it in your local industrial composting facility as it may contaminate the composting process and cause harm to the environment.",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: const FrostedGlass(
                      w: 95.00,
                      h: 95.00,
                      img: 'assets/images/camera_button2.png'),
                ),
              ),
              // if (pictureFile != null)
              //   SizedBox(
              //       width: screenWidth,
              //       height: screenHeight,
              //       child: FittedBox(
              //           fit: BoxFit.cover,
              //           child: Image.file(File(pictureFile!.path)))),
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
