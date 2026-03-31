import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:practisecorner/purchasecourcesclass/Liveclasss.dart';
import 'package:practisecorner/screens/bottombar/liveclass.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Mylibrarypurchasedetails extends StatefulWidget {
  const Mylibrarypurchasedetails({super.key});

  @override
  State<Mylibrarypurchasedetails> createState() =>
      _MylibrarypurchasedetailsState();
}

class _MylibrarypurchasedetailsState extends State<Mylibrarypurchasedetails> {
  late double h, w;
  int activeIndex = 0;
  final List<String> tabs = [
    'Combo',
    'Description',
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.Second,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: SizedBox(
          height: 30, // Ensures text visibility
          child: Marquee(
            text: '1st Crush Course (From Student)',
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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: h * 0.03,
                width: w,
                decoration: const BoxDecoration(
                  color: CustomColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          // Tab headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(tabs.length, (index) {
              final isActive = index == activeIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: Container(
                  height: h * 0.049,
                  width: w * 0.28,
                  decoration: BoxDecoration(
                    color: isActive ? CustomColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: CustomColors.primary,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 17,
                      color: isActive ? Colors.white : CustomColors.primary,
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          // Display content based on selected tab
          Expanded(
            child: IndexedStack(
              index: activeIndex,
              children: const [
                // Each tab content
                AllScreen(),
                // Faq(),
                Description(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Define screens for each tab

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    // Initialize screen dimensions
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Wrap ListView.builder with Expanded for proper scrolling
                Expanded(
                  child: ListView.builder(
                    itemCount: 4, // Number of items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          height: h * 0.20,
                          width: w * 0.95,
                          decoration: BoxDecoration(
                            color: Colors
                                .grey[200], // Placeholder color for container
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Left Image
                                  Padding(
                                    padding: EdgeInsets.all(w * 0.03),
                                    child: Image.asset(
                                      'assets/icons/pc7.jpeg',
                                      height: h * 0.15, // Small image
                                      width: w * 0.24,
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  // Right Text Content
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.02),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Reet 2024 Level 1st Crush Course (From Studio)',
                                            style: TextStyle(
                                              fontFamily: 'sc',
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: h * 0.01),
                                          Row(
                                            children: [
                                              Text(
                                                '155 Pdf',
                                                style: TextStyle(
                                                  fontFamily: 'sc',
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                              SizedBox(width: w * 0.10),
                                              const Text(
                                                'Live Class Video 150',
                                                style: TextStyle(
                                                  fontFamily: 'sc',
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}

//descriptionpage
class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  late double h, w;

  // List of texts for each row
  final List<String> courseInfo = [
    'Course Information and Syllabus',
    'Live Class Schedule',
    'परिचर्चा',
    'Mathematics By Munfed Khan Sir',
    'पर्यावरण शिक्षण विधियां - विजय देवी सिंह सर ',
    'शिक्षा मनोविज्ञान (Psychology) - राजेश सर  ',
    'प्रथम भाषा - हिंदी सुनील खोखरिया सर',
  ];

  @override
  Widget build(BuildContext context) {
    // Initialize dimensions using MediaQuery
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Livecls()));
      },
      child: ListView.builder(
        itemCount: courseInfo.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: h * 0.06,
                  width: w * 0.16,
                  decoration: BoxDecoration(
                    color: CustomColors.primary,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}', // Dynamic numbering
                    style: const TextStyle(
                      fontFamily: 'sc',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: w * 0.03),
                Expanded(
                  child: Text(
                    courseInfo[index], // Dynamic text based on index
                    style: const TextStyle(
                      fontFamily: 'sc',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
