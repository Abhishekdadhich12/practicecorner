import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquee/marquee.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:practisecorner/utills/custom_text.dart';

class Buycourse extends StatefulWidget {
  const Buycourse({super.key});

  @override
  State<Buycourse> createState() => _BuynowState();
}

class _BuynowState extends State<Buycourse> {
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
              text: 'Course Invoice',
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
        body: Stack(children: [
          Column(children: [
            Stack(
              children: [
                Container(
                  height: h * 0.35,
                  width: w,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    color: CustomColors.Second,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Container(
                    height: h * 0.18,
                    width: w,
                    decoration: const BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: h * 0.030, left: w * 0.03),
                    child: Container(
                      height: h * 0.29,
                      width: w * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h * 0.10,
                          width: w * 0.20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/icons/pc1.jpeg',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: h * 0.07,
                    width: w,
                    decoration: BoxDecoration(
                        color: CustomColors.Second,
                        borderRadius: BorderRadius.circular(9)),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/coupon.png',
                          height: h * 0.10,
                          width: w * 0.10,
                        ),
                        const Text(
                          'Apply Coupon',
                          style: TextStyle(fontSize: 17, fontFamily: 'sc'),
                        ),
                        SizedBox(
                          width: w * 0.35,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              isScrollControlled:
                                  true, // Enable full control over the height
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom, // Adjust for keyboard
                                  ),
                                  child: SingleChildScrollView(
                                    // Make content scrollable
                                    child: Container(
                                      height: h * 0.5, // Fixed height
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 5,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/download 2.png',
                                                height: h * 0.09,
                                                width: w * 0.24,
                                              ),
                                              const Text(
                                                'GK & GS Brahmastra 3.0 Batch',
                                                style: TextStyle(
                                                    fontFamily: 'sc',
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: h * 0.01),
                                          const Text(
                                            'Enter Coupon',
                                            style: TextStyle(
                                                fontFamily: 'sc', fontSize: 15),
                                          ),
                                          SizedBox(height: h * 0.02),
                                          customTextField(
                                              hintText: 'Enter Coupon Code '),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: h * 0.06,
                                                width: w * 0.40,
                                                decoration: BoxDecoration(
                                                    color: CustomColors.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                      fontFamily: 'sc',
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                alignment: Alignment.center,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: h * 0.06,
                                                  width: w * 0.40,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          CustomColors.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontFamily: 'sc',
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                            'SELECT',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sc',
                                color: CustomColors.primary),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Details',
                        style: TextStyle(fontFamily: 'sc', fontSize: 20),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(fontFamily: 'sc', fontSize: 16),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '₹',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 2999.00',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Discount',
                            style: TextStyle(fontFamily: 'sc', fontSize: 16),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '-₹',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 2999.00',
                                  style: TextStyle(
                                      fontFamily: 'sc',
                                      fontSize: 16,
                                      color: CustomColors.primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Sub Total',
                                style:
                                    TextStyle(fontFamily: 'sc', fontSize: 16),
                              ),
                              SizedBox(
                                  width:
                                      8), // Adds some spacing between Sub Total and GST Included
                              Text(
                                '(GST Included)',
                                style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 9,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '-₹',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 999.00',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount To Pay',
                            style: TextStyle(fontFamily: 'sc', fontSize: 16),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '-₹',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 2999.00',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Container(
                        height: h * 0.067,
                        width: w * 0.99,
                        decoration: BoxDecoration(
                            color: CustomColors.primary,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          'PROCEED',
                          style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ],
            )
          ])
        ]));
  }
}
