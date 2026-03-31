import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/purchasecourcesclass/mylibrarypurchase.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Mylibrary extends StatefulWidget {
  const Mylibrary({super.key});

  @override
  State<Mylibrary> createState() => _MylibraryState();
}

class _MylibraryState extends State<Mylibrary> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: SizedBox(
          height: 30, // Ensures text visibility
          child: Marquee(
            text: 'My Library Practice Corner',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'sc',
              fontSize: 18,
            ),
            scrollAxis: Axis.horizontal,
            blankSpace: 50.0,
            velocity: 30.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: h * 0.20),
        child: Column(
          children: [
            Center(child: Image.asset('assets/icons/my1.png')),
            SizedBox(
              height: h * 0.02,
            ),
            const Text(
              'No Course Available',
              style: TextStyle(
                fontFamily: 'sc',
                fontSize: 20,
                color: Color(0xffFD1010),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.25,
              width: w * 0.99,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Want to know how to buy a course?',
                          style: TextStyle(
                            fontFamily: 'sc',
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Step 1: Select the course.',
                          style: TextStyle(
                            fontFamily: 'sc',
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'Step 2: Read course details and description.',
                          style: TextStyle(
                            fontFamily: 'sc',
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'Step 3: Select a payment method and pay.',
                          style: TextStyle(
                            fontFamily: 'sc',
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                type: PageTransitionType
                                    .leftToRight, // Smooth entry
                                child:
                                    Mylibrarypurchase(), // Replace with your next screen
                                duration: Duration(milliseconds: 500),
                                reverseDuration: Duration(milliseconds: 300),
                              ),
                            );
                          },
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: CustomColors.primary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Watch Now',
                                    style: TextStyle(
                                      fontFamily: 'sc',
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Container(
                                    height: h * 0.02,
                                    width: w * 0.004,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  const Icon(
                                    Icons.live_tv_outlined,
                                    color: Colors.white,
                                    size: 27,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
