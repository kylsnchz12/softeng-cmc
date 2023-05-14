import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CompostableScreen extends StatefulWidget {
  const CompostableScreen({super.key});

  @override
  State<CompostableScreen> createState() => _CompostableScreenState();
}

class _CompostableScreenState extends State<CompostableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 415,
            width: 415,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/leaves.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              height: 300,
              width: 415,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/wind.gif"),
                  fit: BoxFit.cover,
                ),
              )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 300),
                child: Container(
                  height: 300,
                  width: 315,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDEFAEE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/check.png',
                        scale: 3,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Compostable",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(19),
                        child: Text(
                          "This item is compostable and can be broken down into nutrient-rich soil through industrial composting facilities. Please dispose of this item in your local industrial composting facility or in your own backyard compost bin.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, top: 640),
            child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF34a97b),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 71, top: 18),
                  child: Text(
                    "Great!",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
