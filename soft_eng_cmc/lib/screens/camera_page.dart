import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'loading.dart';
import 'package:loading_overlay/loading_overlay.dart';

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
  bool isLoading = false;
  bool resultCall = false;

  Future<String> uploadImage(File imageFile) async {
    var stream = http.ByteStream(imageFile.openRead());
    stream.cast();
    var length = await imageFile.length();

    var uri = Uri.parse('https://3e4c-143-44-165-242.ngrok-free.app/upload');
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
      print(message);
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

    return LoadingOverlay(
      isLoading: isLoading,
      child: Stack(
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
            ],
          ),
          Positioned(
            bottom: 40,
            child: Row(
              children: [
                const SizedBox(width: 37),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      pictureFile =
                          await widget.cameraController?.takePicture();

                      File imageFile = File(pictureFile!.path);

                      String result = await uploadImage(imageFile);
                      setState(() {
                        isLoading = false;
                      });
                      print(result);

                      if (resultCall == true) {
                        print("here on resultCall true");

                        Navigator.pushNamed(context, "compostable");
                      } else {
                        print("here on else");

                        Navigator.pushNamed(context, "noncompost");
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
                // const FrostedGlass(
                //     w: 65.00, h: 65.00, img: 'assets/images/setting2.png'),
              ],
            ),
          )
        ],
      ),
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
