import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NonCompostable extends StatefulWidget {
  const NonCompostable({super.key});

  @override
  State<NonCompostable> createState() => _NonCompostableState();
}

class _NonCompostableState extends State<NonCompostable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: 400,
            width: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/rain.gif"),
                fit: BoxFit.cover,
              ),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 300,
                    width: 315,
                    decoration: BoxDecoration(
                      color: const Color(0xFFf4f4f4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/error.png',
                          scale: 2,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "Non Compostable",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(19),
                          child: Text(
                            "This item is not compostable and cannot be broken down into nutrient-rich soil. Please dispose of this item in your regular trash. Note: Do not attempt to compost this item in your backyard compost bin or dispose of it in your local industrial composting facility as it may contaminate the composting process and cause harm to the environment.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFe05a54),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 71, top: 19),
                        child: Text(
                          " Done",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 700),
          child: Container(
            height: 200,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/earth.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
