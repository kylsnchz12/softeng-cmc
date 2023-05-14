import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final List<dynamic> _products = [
    {
      'title': 'Choose a Location',
      'image': 'assets/images/c1.png',
      'description': 'Step One'
    },
    {
      'title': 'Obtain Compost Bins',
      'image': 'assets/images/c2.png',
      'description': 'Step Two'
    },
    {
      'title': 'Gather the correct tools for composting',
      'image': 'assets/images/c3.png',
      'description': 'Step Three'
    },
    {
      'title': 'Learn what and what not to compost​',
      'image': 'assets/images/c4.png',
      'description': 'Step Four'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: 900,
            width: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/giphy.gif"),
                fit: BoxFit.cover,
              ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 40, bottom: 20),
              child: Image.asset(
                'assets/images/loogo.png',
                scale: 6,
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 18, top: 0, bottom: 0),
            //   child: Text(
            //     "Transform your waste into treasure",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 518,
              child: CarouselSlider(
                  options: CarouselOptions(
                    height: 450,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.70,
                    enlargeCenterPage: true,
                  ),
                  items: _products.map((product) {
                    return Builder(builder: (context) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 5))
                            ]),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 320,
                                clipBehavior: Clip.hardEdge,
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(
                                  product['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(product['title'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                product['description'],
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade600),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  }).toList()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Material(
                    //   color: Colors.transparent,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(50),
                    //       child: Image.asset('assets/images/menu_button.png',
                    //           width: 60, height: 60),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(width: 40),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "cameraPage");
                          },
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => MainScreen(
                          //                 nextpage: 2,
                          //               )));
                          // },
                          // onTap: () async {
                          //   await availableCameras().then(
                          //     (value) => Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (_) => CameraScreen(cameras: value),
                          //       ),
                          //     ),
                          //   );
                          // },
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
                    // Material(
                    //   color: Colors.transparent,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(50),
                    //       child: Image.asset('assets/images/setting_button.png',
                    //           width: 60, height: 60),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
