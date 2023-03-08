// import 'package:flutter/material.dart';
// import 'package:soft_eng_cmc/screens/home_screen.dart';

// import 'camera_page.dart';
// // import 'camera_screen.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   PageController _pageViewController = PageController(initialPage: 0);

//   void changePage(int index) {
//     _pageViewController.animateToPage(index,
//         duration: const Duration(milliseconds: 1000), curve: Curves.bounceIn);
//     _pageViewController.jumpToPage(index);
//   }

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
