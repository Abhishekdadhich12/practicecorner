import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/screens/bottombar/favourite.dart';
import 'package:practisecorner/screens/bottombar/liveclass.dart';
import 'package:practisecorner/screens/bottombar/search.dart';
import 'package:practisecorner/screens/coursedetail.dart';
import 'package:practisecorner/screens/liveclasses.dart';
import 'package:practisecorner/screens/livetests.dart';
import 'package:practisecorner/screens/mylibrary.dart';
import 'package:practisecorner/utills/custom_colors.dart';

import '../drawer/drawer.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  String? selectedOption = 'Practice Corner';
  String selectedTab = 'Free';
  String selectedoptionallshowGkandgsExam = 'Gk & GS';
  String selectedOptionallindiaexam = 'All India Exam';
  final GlobalKey _menuKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  bool allIndiaExam = false;
  List indiaExam = [
    "ALL INDIA EXAMS",
    "Rajasthan Exams",
    "Utter Pradesh Exam",
    "UGC NET JRF",
    "Madhya Pradesh Exam",
    "Bihar Exams",
    "Haryana Exams",
    "Jharkhand Exams",
    "Panjab Exams",
    "Subject wise Courses"
  ];
  bool gk = false;
  List gkLst = [
    "GK & GS CLASSES",
    "UPSC (IAS)",
    "SSC Foundations (CGL CHSL)",
    "SSC GD (Constable)",
    "Delhi Police",
    "FCI",
    "Railway ALP & Technician",
    "Railway RPF SI & Constable",
    "Railway NTPC",
    "Railway Group D",
    "CTET",
    "Bank Exams",
    "SSC MTS",
    "SSC CPO",
    "UGC NET Paper 1 & 2",
    "KVS PRT",
    "KVS TGT",
    "KVS  PGT",
    "DSSSB",
    "Current Affairs",
    "NCERT"
  ];
  late double h, w;
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const Mydrawer(),
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Text(
              selectedOption ?? 'Practice Corner',
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'sc',
                color: CustomColors.primarytext,
              ),
            ),
            GestureDetector(
              key: _menuKey,
              onTap: () {
                final RenderBox renderBox =
                    _menuKey.currentContext!.findRenderObject() as RenderBox;
                final position = renderBox.localToGlobal(Offset.zero);
                final appBarHeight = AppBar().preferredSize.height;

                showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    position.dx,
                    position.dy + renderBox.size.height + 5,
                    position.dx + renderBox.size.width,
                    appBarHeight + 100,
                  ),
                  items: <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                        value: 'Government Exam',
                        child: Text('GOVERNMENT EXAM',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                    const PopupMenuItem<String>(
                        value: 'Nursing',
                        child: Text('NURSING',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                    const PopupMenuItem<String>(
                        value: 'NEET/JEE',
                        child: Text('NEET/JEE',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                    const PopupMenuItem<String>(
                        value: 'Defence',
                        child: Text('DEFENCE',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                    const PopupMenuItem<String>(
                        value: 'Clat',
                        child: Text('CLAT/Law Exam',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                    const PopupMenuItem<String>(
                        value: 'Engg',
                        child: Text('ENGINEERING',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                    const PopupMenuItem<String>(
                        value: 'CUET',
                        child: Text('CUET',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                    const PopupMenuItem<String>(
                        value: 'Agriculture',
                        child: Text('AGRICULTURE',
                            style: TextStyle(
                              fontFamily: 'sc',
                            ))),
                  ],
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      selectedOption = value;
                    });
                  }
                });
              },
              child: const Icon(Icons.arrow_drop_down, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.rightToLeft, // Smooth entry
                  child: Favourite(), // Replace with your next screen
                  duration: Duration(milliseconds: 500),
                  reverseDuration: Duration(milliseconds: 300),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Navigate to the search screen
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.bottomToTop, // Smooth entry
                  child: Search(), // Replace with your next screen
                  duration: Duration(milliseconds: 500),
                  reverseDuration: Duration(milliseconds: 300),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  type: PageTransitionType
                                      .leftToRight, // Smooth entry
                                  child:
                                      Mylibrary(), // Replace with your next screen
                                  duration: Duration(milliseconds: 500),
                                  reverseDuration: Duration(milliseconds: 300),
                                ),
                              );
                            },
                            child: _buildFeatureCard(
                                "assets/icons/mylibrary1.svg", "My", "Library"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  type: PageTransitionType
                                      .rightToLeftWithFade, // Smooth entry
                                  child:
                                      Liveclasses(), // Replace with your next screen
                                  duration: Duration(milliseconds: 900),
                                  reverseDuration: Duration(milliseconds: 900),
                                ),
                              );
                            },
                            child: _buildFeatureCard(
                                "assets/icons/liveclasss.svg",
                                "Live",
                                "Classes"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  type: PageTransitionType
                                      .leftToRight, // Smooth entry
                                  child:
                                      Livetest(), // Replace with your next screen
                                  duration: Duration(milliseconds: 500),
                                  reverseDuration: Duration(milliseconds: 300),
                                ),
                              );
                            },
                            child: _buildFeatureCard(
                                "assets/icons/livetest.svg", "Live", "Tests"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: h * 0.27, left: w * 0.06, right: w * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                allIndiaExam = !allIndiaExam;
                              });
                            },
                            child: Container(
                              width: w * 0.33,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      selectedOptionallindiaexam,
                                      style: const TextStyle(
                                        fontFamily: 'sc',
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gk = !gk;
                              });
                            },
                            child: Container(
                              width: w * 0.33,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      selectedoptionallshowGkandgsExam,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 13,
                                        fontFamily: 'sc',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _openFullWidthBottomSheet(context);
                            },
                            child: Container(
                              height: h * 0.043,
                              width: w * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/filter.svg',
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6, // Number of items in the grid
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing:
                                10, // Horizontal space between items
                            mainAxisSpacing: 10, // Vertical space between items
                            childAspectRatio: 0.59),
                    itemBuilder: (context, index) {
                      List<String> imagePaths = [
                        'assets/icons/pc1.jpeg', // First image
                        'assets/icons/pc2.jpeg', // Second image
                        'assets/icons/pc3.jpeg', // Third image
                        'assets/icons/pc4.jpeg', // Fourth image
                        'assets/icons/pc6.jpeg', // Fifth image
                        'assets/icons/pc5.jpeg', // Sixth image
                      ];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                              type: PageTransitionType
                                  .rightToLeft, // Smooth entry
                              child:
                                  Coursedetail(), // Replace with your next screen
                              duration: Duration(milliseconds: 500),
                              reverseDuration: Duration(milliseconds: 300),
                            ),
                          );
                        },
                        child: Container(
                          height: 500,
                          width: 200,
                          decoration: BoxDecoration(
                            color: CustomColors.Second,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.grey, width: 0.6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Center horizontally
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                          9), // Match the container's top border radius
                                      topRight: Radius.circular(9),
                                      bottomLeft: Radius.circular(9),
                                      bottomRight: Radius.circular(9)),
                                  child: Image.asset(
                                    imagePaths[index],
                                    height: h *
                                        0.21, // Adjust to match the desired height
                                    width: w *
                                        0.44, // Make the image fill the width of the container
                                    fit: BoxFit
                                        .contain, // Ensure the image covers the available space
                                  ),
                                ),
                                const SizedBox(
                                    height: 10), // Space between image and text
                                const Text(
                                  'Gk & GS Brahmastra 3.0', // Replace with your text
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sc',
                                  ),
                                  // Center-align the text
                                ),
                                const Text(
                                  'Batch', // Replace with your text
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'sc',
                                      fontWeight: FontWeight.bold),
                                  // Center-align the text
                                ),
                                const Text(
                                  'Validity 365 Days', // Replace with your text
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'sc',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  // Center-align the text
                                ),
                                const Text(
                                  '₹ 399/-', // Display the ₹ symbol with the price
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: CustomColors.primary,
                                    fontFamily: 'sc',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign:
                                      TextAlign.center, // Center-align the text
                                ),
                                const Text(
                                  '₹ 2999/-', // Display the ₹ symbol with the price
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sc',

                                    color: Colors.grey,
                                    decoration: TextDecoration
                                        .lineThrough, // Apply line-through (strikethrough)
                                  ),
                                  textAlign:
                                      TextAlign.center, // Center-align the text
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            allIndiaExam
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        allIndiaExam = false;
                      });
                    },
                    child: Container(
                      width: w * 1,
                      height: h * 1,
                      color: Colors.transparent,
                      padding: EdgeInsets.only(left: w * 0.09, top: h * 0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w * 0.58,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                border: Border.all(
                                    color: const Color(0xff928F8F)
                                        .withOpacity(0.3))),
                            child: ListView.builder(
                                itemCount: indiaExam.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: w * 0.04),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedOptionallindiaexam =
                                            indiaExam[index];
                                        allIndiaExam = false;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.01),
                                      child: Text(indiaExam[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: index != 0
                                                ? FontWeight.w500
                                                : FontWeight.w600,
                                            fontFamily: 'sc',
                                            color: Colors.black,
                                          )),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            gk
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        gk = false;
                      });
                    },
                    child: Container(
                      width: w * 1,
                      height: h * 1,
                      color: Colors.transparent,
                      padding: EdgeInsets.only(left: w * 0.23, top: h * 0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w * 0.7,
                            height: h * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                border: Border.all(
                                    color: const Color(0xff928F8F)
                                        .withOpacity(0.3))),
                            child: ListView.builder(
                                itemCount: gkLst.length,
                                shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: w * 0.04),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedoptionallshowGkandgsExam =
                                            gkLst[index];
                                        gk = false;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.01),
                                      child: Text(gkLst[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: index != 0
                                                ? FontWeight.w500
                                                : FontWeight.w600,
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          )),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String assetPath, String title, String subtitle) {
    return Container(
      height: h * 0.19,
      width: w * 0.26,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9), // Shadow color with opacity
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Horizontal and vertical shadow offset
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            height: h * 0.05,
            width: w * 0.20,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              text: "$title\n",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'sc',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'sc',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _openFullWidthBottomSheet(BuildContext context) {
    String selectedTab = 'Free';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.34,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.015),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Advance Filters',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03),
                    child: const Text(
                      'Course Type',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Free';
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            color: selectedTab == 'Free'
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Free',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 16,
                              color: selectedTab == 'Free'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Paid';
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            color: selectedTab == 'Paid'
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Paid',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'sc',
                              color: selectedTab == 'Paid'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Both';
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            color: selectedTab == 'Both'
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Both',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 16,
                              color: selectedTab == 'Both'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: CustomColors.primary,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'Apply Filter',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'sc',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
