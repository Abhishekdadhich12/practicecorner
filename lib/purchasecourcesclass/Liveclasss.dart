import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:practisecorner/purchasecourcesclass/Liveclasss.dart';
import 'package:practisecorner/purchasecourcesclass/viewpdf.dart';
import 'package:practisecorner/screens/bottombar/liveclass.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Livecls extends StatefulWidget {
  const Livecls({super.key});

  @override
  State<Livecls> createState() => _LiveclsState();
}

class _LiveclsState extends State<Livecls> {
  late double h, w;
  int activeIndex = 0;
  final List<String> tabs = ['All', 'Video', 'Pdf'];

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
                All(),
                Video(),
                Pdf(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// All screens for each tab

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  late double h, w;
  List<String> images = [
    'assets/icons/pc1.jpeg',
    'assets/icons/pc3.jpeg',
    'assets/icons/pc4.jpeg',
    'assets/icons/pc7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
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
                          height: h * 0.21,
                          width: w * 0.95,
                          decoration: BoxDecoration(
                            color: Colors
                                .grey[200], // Placeholder color for container
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Image
                              Padding(
                                padding: EdgeInsets.all(w * 0.03),
                                child: Image.asset(
                                  images[index],
                                  height: h * 0.12, // Small image
                                  width: w * 0.18,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              // Right Column with Text and Icons
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Part-1 || पर्यावरण अध्ययन का परिचय ||   ',
                                        style: TextStyle(
                                          fontFamily: 'sc',
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      Row(
                                        children: [
                                          Text(
                                            '21- December',
                                            style: TextStyle(
                                              fontFamily: 'sc',
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(width: w * 0.10),
                                        ],
                                      ),
                                      SizedBox(height: h * 0.06),
                                      Row(
                                        children: [
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: Text(
                                              'Watch',
                                              style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: w * 0.02),
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: Text(
                                              'Listen',
                                              style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: w * 0.02),
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.14,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: Text(
                                              'Share',
                                              style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Column with Share and Download Icons (on the right side)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // Download Icon (use a different image here for download)
                                    GestureDetector(
                                        onTap: () {
                                          // Handle download logic
                                        },
                                        child: Icon(
                                          Icons.share,
                                          size: 16,
                                        )),
                                    SizedBox(
                                        height:
                                            h * 0.02), // Space between icons

                                    // Share Icon (use a different image here for share)
                                    GestureDetector(
                                        onTap: () {
                                          // Handle share logic
                                        },
                                        child: Icon(
                                          Icons.download,
                                          size: 16,
                                        )),
                                  ],
                                ),
                              ),
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

//videoscreen

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late double h, w;
  List<String> images = [
    'assets/icons/pc1.jpeg',
    'assets/icons/pc3.jpeg',
    'assets/icons/pc7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
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
                    itemCount: 3, // Number of items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          height: h * 0.21,
                          width: w * 0.95,
                          decoration: BoxDecoration(
                            color: Colors
                                .grey[200], // Placeholder color for container
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Image
                              Padding(
                                padding: EdgeInsets.all(w * 0.03),
                                child: Image.asset(
                                  images[index],
                                  height: h * 0.12, // Small image
                                  width: w * 0.18,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              // Right Column with Text and Icons
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Part-1 || पर्यावरण अध्ययन का परिचय ||   ',
                                        style: TextStyle(
                                          fontFamily: 'sc',
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      Row(
                                        children: [
                                          Text(
                                            '21- December',
                                            style: TextStyle(
                                              fontFamily: 'sc',
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(width: w * 0.10),
                                        ],
                                      ),
                                      SizedBox(height: h * 0.06),
                                      Row(
                                        children: [
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: Text(
                                              'Watch',
                                              style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: w * 0.02),
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: Text(
                                              'Listen',
                                              style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: w * 0.02),
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.14,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: Text(
                                              'Share',
                                              style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Column with Share and Download Icons (on the right side)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // Download Icon (use a different image here for download)
                                    GestureDetector(
                                        onTap: () {
                                          // Handle download logic
                                        },
                                        child: Icon(
                                          Icons.share,
                                          size: 16,
                                        )),
                                    SizedBox(
                                        height:
                                            h * 0.02), // Space between icons

                                    // Share Icon (use a different image here for share)
                                    GestureDetector(
                                        onTap: () {
                                          // Handle share logic
                                        },
                                        child: Icon(
                                          Icons.download,
                                          size: 16,
                                        )),
                                  ],
                                ),
                              ),
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

//pdfscreen
class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  late double h, w;
  List<String> images = [
    'assets/icons/pdf.png',
    'assets/icons/pdf.png',
    'assets/icons/pdf.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                    itemCount: 3, // Number of items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          height: h * 0.21,
                          width: w * 0.95,
                          decoration: BoxDecoration(
                            color: Colors
                                .grey[200], // Placeholder color for container
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Image
                              Padding(
                                padding: EdgeInsets.all(w * 0.03),
                                child: Image.asset(
                                  images[index],
                                  height: h * 0.12, // Small image
                                  width: w * 0.18,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              // Right Column with Text and Icons
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Part-1 || पर्यावरण अध्ययन का परिचय ||   ',
                                        style: TextStyle(
                                          fontFamily: 'sc',
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      Row(
                                        children: [
                                          Text(
                                            '21- December',
                                            style: TextStyle(
                                              fontFamily: 'sc',
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(width: w * 0.10),
                                        ],
                                      ),
                                      SizedBox(height: h * 0.06),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DocumentView(
                                                              apptitle:
                                                                  'pdfview',
                                                              pdfUrl:
                                                                  'https://rsmssb.rajasthan.gov.in/download_file?downloadFileId=2612')));
                                            },
                                            child: Container(
                                              height: h * 0.04,
                                              width: w * 0.20,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                border: Border.all(
                                                    color:
                                                        CustomColors.primary),
                                              ),
                                              child: Text(
                                                'Read',
                                                style: TextStyle(
                                                  fontFamily: 'sc',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          SizedBox(width: w * 0.02),
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: Text(
                                              'Share',
                                              style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Column with Share and Download Icons (on the right side)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // Download Icon (use a different image here for download)
                                    GestureDetector(
                                        onTap: () {
                                          // Handle download logic
                                        },
                                        child: Icon(
                                          Icons.share,
                                          size: 16,
                                        )),
                                    SizedBox(
                                        height:
                                            h * 0.02), // Space between icons

                                    // Share Icon (use a different image here for share)
                                    GestureDetector(
                                        onTap: () {
                                          // Handle share logic
                                        },
                                        child: Icon(
                                          Icons.download,
                                          size: 16,
                                        )),
                                  ],
                                ),
                              ),
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
