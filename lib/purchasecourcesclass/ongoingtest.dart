import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/purchasecourcesclass/attemptquiz.dart';
import 'package:practisecorner/purchasecourcesclass/viewpdf.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Ongoingtest extends StatefulWidget {
  const Ongoingtest({super.key});

  @override
  State<Ongoingtest> createState() => _OngoingtestState();
}

class _OngoingtestState extends State<Ongoingtest> {
  late double h, w;

  int activeIndex = 0;
  final List<String> tabs = ['All', 'Video', 'Pdf', 'Test'];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.Second,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'संधि',
          style: TextStyle(color: Colors.white, fontFamily: 'sc', fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                    width: w * 0.20,
                    decoration: BoxDecoration(
                      color: isActive ? CustomColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(13),
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
                  Test(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  late double h, w;
  List<String> images = [
    'assets/icons/watch.png',
    'assets/icons/telegram.png',
  ];
  List<String> text = [
    'Attempt Quiz',
    'Attempt Quiz',
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
                    itemCount: 2, // Number of items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          height: h * 0.17,
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
                                        'Complete Quiz || संधि ||   ',
                                        style: TextStyle(
                                          fontFamily: 'sc',
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.06),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .rightToLeft, // Smooth entry
                                                  child:
                                                      Attemptquiz(), // Replace with your next screen
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: h * 0.04,
                                              width: w * 0.25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                border: Border.all(
                                                    color:
                                                        CustomColors.primary),
                                              ),
                                              child: Text(
                                                text[index],
                                                style: TextStyle(
                                                  fontFamily: 'sc',
                                                  fontSize: 13,
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
                                                fontSize: 13,
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

//test
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late double h, w;
  List<String> images = [
    'assets/icons/watch.png',
    'assets/icons/watch.png',
    'assets/icons/watch.png',
    'assets/icons/watch.png',
  ];
  List<String> text = [
    'Attempt quiz',
    'Attempt quiz',
    'Attempt quiz',
    'Attempt quiz',
  ];
  List<String> text1 = [
    'Complete Quiz || संधि ||',
    'Complete Quiz || GK ||',
    'Complete Quiz || Science ||',
    'Complete Quiz || English ||',
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                              type: PageTransitionType
                                  .rightToLeft, // Smooth entry
                              child:
                                  Attemptquiz(), // Replace with your next screen
                              duration: Duration(milliseconds: 500),
                              reverseDuration: Duration(milliseconds: 300),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            height: h * 0.17,
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
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * 0.02),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          text1[index],
                                          style: TextStyle(
                                            fontFamily: 'sc',
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(height: h * 0.06),
                                        Row(
                                          children: [
                                            Container(
                                              height: h * 0.04,
                                              width: w * 0.25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                border: Border.all(
                                                    color:
                                                        CustomColors.primary),
                                              ),
                                              child: Text(
                                                text[index],
                                                style: TextStyle(
                                                  fontFamily: 'sc',
                                                  fontSize: 13,
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
                                                    color:
                                                        CustomColors.primary),
                                              ),
                                              child: Text(
                                                'Share',
                                                style: TextStyle(
                                                  fontFamily: 'sc',
                                                  fontSize: 13,
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}

//video

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late double h, w;
  List<String> images = [
    'assets/icons/pc3.jpeg',
    'assets/icons/pc4.jpeg',
    'assets/icons/pc7.jpeg',
  ];

  String youtubeUrl = "https://youtu.be/MeJO9MP3Ygg?si=awdUrtgRS6FHxMfZ";

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      height: h * 0.21,
                      width: w * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(w * 0.03),
                            child: Image.asset(
                              images[index],
                              height: h * 0.12,
                              width: w * 0.18,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: h * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Part-1 || पर्यावरण अध्ययन का परिचय ||',
                                    style: TextStyle(
                                        fontFamily: 'sc', fontSize: 11),
                                  ),
                                  SizedBox(height: h * 0.01),
                                  Text(
                                    '21- December',
                                    style: TextStyle(
                                        fontFamily: 'sc',
                                        fontSize: 14,
                                        color: Colors.grey[600]),
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
                                                  VideoPlayerScreen(
                                                      videoUrl: youtubeUrl),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: h * 0.04,
                                          width: w * 0.20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            border:
                                                Border.all(color: Colors.blue),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Watch',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// YouTube Player Screen
class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController? _controller;
  String? videoId;

  @override
  void initState() {
    super.initState();

    // Extract the video ID from the URL
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CustomColors.primary,
          title: const Text(
            "Live Class In Practice Corner",
            style:
                TextStyle(fontFamily: 'sc', fontSize: 20, color: Colors.white),
          )),
      body: Center(
        child: _controller != null
            ? YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              )
            : const Text(
                "Invalid Video URL",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
      ),
    );
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
                                          Container(
                                            height: h * 0.04,
                                            width: w * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                  color: CustomColors.primary),
                                            ),
                                            child: GestureDetector(
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
                                              child: Text(
                                                'Read',
                                                style: TextStyle(
                                                  fontFamily: 'sc',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
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
