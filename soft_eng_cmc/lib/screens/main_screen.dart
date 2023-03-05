import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xFFeff3ec),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: screenWidth,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF00a15a),
                  ),
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFF00a15a),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 60, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Save planet together",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "News",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset('assets/images/news1.png',
                                    width: 250, height: 150),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 80,
                              left: 17,
                              right: 17,
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                        "Climate change is exacerbating human-wildlife conflict but solutions await: Study",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(width: 7),
                      Stack(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset('assets/images/news2.png',
                                    width: 250, height: 150),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 80,
                              left: 17,
                              right: 17,
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                        "Climate change is exacerbating human-wildlife conflict but solutions await: Study",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(width: 7),
                      Stack(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset('assets/images/news3.png',
                                    width: 250, height: 150),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 80,
                              left: 17,
                              right: 17,
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                        "Climate change is exacerbating human-wildlife conflict but solutions await: Study",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Composting tips",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF00a15a),
                          ),
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xFF00a15a),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF00a15a),
                          ),
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xFF00a15a),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF00a15a),
                          ),
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xFF00a15a),
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/images/menu_button.png',
                              width: 60, height: 60),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                                'assets/images/camera_button.png',
                                width: 95,
                                height: 95),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/images/setting_button.png',
                              width: 60, height: 60),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
