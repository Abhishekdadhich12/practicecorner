import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/purchasecourcesclass/ongoingtest.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Livetest extends StatefulWidget {
  const Livetest({super.key});

  @override
  State<Livetest> createState() => _LivetestState();
}

class _LivetestState extends State<Livetest> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primary,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Live Test',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sc',
              fontSize: 20,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 3.0,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontFamily: 'sc', fontSize: 16),
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: 'On-Going',
              ),
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Widgets for each tab
            OngoingTab(),
            UpcomingTab(),
            CompletedTab(),
          ],
        ),
      ),
    );
  }
}

class OngoingTab extends StatefulWidget {
  const OngoingTab({Key? key}) : super(key: key);

  @override
  State<OngoingTab> createState() => _OngoingTabState();
}

class _OngoingTabState extends State<OngoingTab> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    // Obtain the screen dimensions using MediaQuery
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Padding(
      padding:
          EdgeInsets.only(top: h * 0.09), // Top padding based on screen height
      child: Column(
        children: [
          Image.asset(
            'assets/icons/checklist 1.png',
            // Width of the image as 50% of the screen width
          ),
          SizedBox(height: h * 0.01), // Spacing of 2% screen height
          Text(
            'No live tests Scheduled.',
            style: TextStyle(
                fontSize: w * 0.05, // Font size 5% of the screen width
                fontFamily: 'sc',
                color: const Color(0xffFD1010)),
          ),
          SizedBox(
            height: h * 0.04,
          ),
          Container(
            height: h * 0.52,
            width: w,
            decoration: const BoxDecoration(color: Color(0xf7B7878)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.47,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How To Take a Live Test ?',
                            style: TextStyle(fontFamily: 'sc', fontSize: 18),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Text(
                            'Step 1 : Choose the Live Test you Want to take.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 2 : Click On Attempt.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 3 : Read the test description and click on the Submit button.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 4 : Take the test and click on the Submit button.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 5 : Provide your Feedback for overall test experience',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  type: PageTransitionType
                                      .rightToLeft, // Smooth entry
                                  child:
                                      Ongoingtest(), // Replace with your next screen
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Upcoming Tab Content
class UpcomingTab extends StatefulWidget {
  const UpcomingTab({Key? key}) : super(key: key);

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    // Obtain the screen dimensions using MediaQuery
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Padding(
      padding:
          EdgeInsets.only(top: h * 0.09), // Top padding based on screen height
      child: Column(
        children: [
          Image.asset(
            'assets/icons/checklist 1.png',
            // Width of the image as 50% of the screen width
          ),
          SizedBox(height: h * 0.01), // Spacing of 2% screen height
          Text(
            'No live tests Scheduled.',
            style: TextStyle(
                fontSize: w * 0.05, // Font size 5% of the screen width
                fontFamily: 'sc',
                color: const Color(0xffFD1010)),
          ),
          SizedBox(
            height: h * 0.04,
          ),
          Container(
            height: h * 0.52,
            width: w,
            decoration: const BoxDecoration(color: Color(0xf7B7878)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.47,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How To Take a Live Test ?',
                            style: TextStyle(fontFamily: 'sc', fontSize: 18),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Text(
                            'Step 1 : Choose the Live Test you Want to take.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 2 : Click On Attempt.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 3 : Read the test description and click on the Submit button.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 4 : Take the test and click on the Submit button.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 5 : Provide your Feedback for overall test experience',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Container(
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Completed Tab Content

class CompletedTab extends StatefulWidget {
  const CompletedTab({Key? key}) : super(key: key);

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    // Obtain the screen dimensions using MediaQuery
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Padding(
      padding:
          EdgeInsets.only(top: h * 0.09), // Top padding based on screen height
      child: Column(
        children: [
          Image.asset(
            'assets/icons/checklist 1.png',
            // Width of the image as 50% of the screen width
          ),
          SizedBox(height: h * 0.01), // Spacing of 2% screen height
          Text(
            'No live tests Completed.',
            style: TextStyle(
                fontSize: w * 0.05, // Font size 5% of the screen width
                fontFamily: 'sc',
                color: const Color(0xffFD1010)),
          ),
          SizedBox(
            height: h * 0.04,
          ),
          Container(
            height: h * 0.52,
            width: w,
            decoration: const BoxDecoration(color: Color(0xf7B7878)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.47,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How To Take a Live Test ?',
                            style: TextStyle(fontFamily: 'sc', fontSize: 18),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Text(
                            'Step 1 : Choose the Live Test you Want to take.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 2 : Click On Attempt.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 3 : Read the test description and click on the Submit button.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 4 : Take the test and click on the Submit button.',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            'Step 5 : Provide your Feedback for overall test experience',
                            style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Container(
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
