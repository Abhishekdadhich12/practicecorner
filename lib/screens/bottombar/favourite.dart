import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/screens/wishlistscreens/buynow.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
            text: 'Wishlist',
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: h * 0.19,
              width: w * 0.95,
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.primary),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Image Section
                    Image.asset(
                      'assets/icons/download 2.png',
                      height: h * 0.16,
                    ),
                    const SizedBox(width: 10), // Space between image and text
                    // Text and Details Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Gk & GS Brahmastra 3.0 ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'sc',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: w * 0.05,
                              ),
                              const Icon(
                                Icons.delete,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          const Text(
                            'Batch',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'sc',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          Container(
                            height: h * 0.03,
                            width: w * 0.12,
                            decoration: BoxDecoration(
                                color: CustomColors.primary,
                                borderRadius: BorderRadius.circular(9)),
                            child: const Text(
                              '89% Off',
                              style: TextStyle(
                                  fontFamily: 'sc',
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            height: h * 0.0034,
                          ),
                          Row(
                            children: [
                              const Text(
                                '₹ 2000',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.primary,
                                ),
                              ),
                              SizedBox(width: w * 0.002),
                              const Text(
                                '₹1000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'sc',
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: w * 0.06),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageTransition(
                                      type: PageTransitionType
                                          .leftToRight, // Smooth entry
                                      child:
                                          Buynow(), // Replace with your next screen
                                      duration: Duration(milliseconds: 500),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: h * 0.04,
                                  width: w * 0.23,
                                  decoration: BoxDecoration(
                                      color: CustomColors.primary,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: const Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'sc',
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
