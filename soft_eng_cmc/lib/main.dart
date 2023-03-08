import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:soft_eng_cmc/screens/camera_page.dart';
import 'package:soft_eng_cmc/screens/home_screen.dart';

late List<CameraDescription> _cameras;

List<CameraDescription> getCamera() {
  return _cameras;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Prelim',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageViewController = PageController(initialPage: 0);

  CameraController? controller;

  Future<void> initCamera({required bool frontCamera}) async {
    controller =
        CameraController(_cameras[(frontCamera) ? 1 : 0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (_cameras.isNotEmpty) {
      initCamera(frontCamera: true);
    }
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageViewController,
        onPageChanged: (int index) {},
        children: <Widget>[
          const HomeScreen(),
          CameraPage(
            cameraController: controller,
          )
        ],
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final PageController _pageViewController = PageController(initialPage: 0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: PageView(
//         physics: const BouncingScrollPhysics(),
//         controller: _pageViewController,
//         onPageChanged: (int index) {},
//         children: const <Widget>[HomeScreen(), CameraPage()],
//       ),
//     );
//   }
// }
