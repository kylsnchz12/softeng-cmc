import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
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
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
                color: const Color(0xFF00a15a),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 60, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "EcoScan",
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
                  "sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
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
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF00a15a),
                        ),
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xFF00a15a),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 12, bottom: 5),
                            child: Text(
                              "Tip 1",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: Text(
                              "Lgorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.industry's standard dummy",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF00a15a),
                        ),
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xFF00a15a),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 12, bottom: 5),
                            child: Text(
                              "Tip 2",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.industry's standard dummy",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF00a15a),
                        ),
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xFF00a15a),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 12, bottom: 5),
                            child: Text(
                              "Tip 3",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy. industry's standard dummyindustry's",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
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
                          child: Image.asset('assets/images/camera_button.png',
                              width: 95, height: 95),
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
    );
  }
}
