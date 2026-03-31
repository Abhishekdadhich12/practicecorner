import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/purchasecourcesclass/mylibrarypurchasedetails.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Mylibrarypurchase extends StatefulWidget {
  const Mylibrarypurchase({super.key});

  @override
  State<Mylibrarypurchase> createState() => _MylibrarypurchaseState();
}

class _MylibrarypurchaseState extends State<Mylibrarypurchase> {
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
            'My Library',
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
            labelStyle: TextStyle(fontFamily: 'sc', fontSize: 14),
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: 'PaidCourse',
              ),
              Tab(text: 'Free Course'),
              Tab(
                text: 'Batch Course',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Widgets for each tab
            PaidcourseTab(),
            FreecouseTab(),
            BatchcourseTab(),
          ],
        ),
      ),
    );
  }
}

//paidcorse
class PaidcourseTab extends StatefulWidget {
  const PaidcourseTab({Key? key}) : super(key: key);

  @override
  State<PaidcourseTab> createState() => _PaidcourseTabState();
}

class _PaidcourseTabState extends State<PaidcourseTab> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    // Obtain the screen dimensions using MediaQuery
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sort Row
          Row(
            children: [
              Text(
                'Sort Your Course',
                style: TextStyle(fontFamily: 'sc', fontSize: 17),
              ),
              SizedBox(width: w * 0.20), // Spacing between text and container
              Container(
                height: h * 0.04,
                width: w * 0.29,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sort By',
                      style: TextStyle(fontFamily: 'sc', fontSize: 17),
                    ),
                    SizedBox(width: w * 0.01), // Spacing for dropdown icon
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: h * 0.02),

          // ListView.builder for courses
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.bottomToTop, // Smooth entry
                    child:
                        Mylibrarypurchasedetails(), // Replace with your next screen
                    duration: Duration(milliseconds: 500),
                    reverseDuration: Duration(milliseconds: 300),
                  ),
                );
              },
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      height: h * 0.40,
                      width: w * 0.95,
                      decoration: BoxDecoration(
                        color:
                            Colors.grey[200], // Placeholder color for container
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
                                  'assets/icons/pc1.jpeg',
                                  height: h * 0.15, // Small image
                                  width: w * 0.24,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              // Right Text Content
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Reet 2024 Level 1st Crush Course (From Studio)',
                                        style: TextStyle(
                                          fontFamily: 'sc',
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      Text(
                                        'Added on: 02 Jan 2025',
                                        style: TextStyle(
                                          fontFamily: 'sc',
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      Row(
                                        children: [
                                          Text(
                                            'UID: 3269599',
                                            style: TextStyle(
                                              fontFamily: 'sc',
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(width: w * 0.10),
                                          Text(
                                            '5% Days Over',
                                            style: TextStyle(
                                              fontFamily: 'sc',
                                              fontSize: 14,
                                              color: CustomColors.primary,
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
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Total Days : 365 days',
                                  style:
                                      TextStyle(fontFamily: 'sc', fontSize: 14),
                                ),
                                SizedBox(width: w * 0.08),
                                Text(
                                  'Remaining Days: 346',
                                  style: TextStyle(
                                    fontFamily: 'sc',
                                    fontSize: 14,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/Group 647.png',
                                height: h * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'You can extend your course vaildity',
                                    style: TextStyle(
                                      fontFamily: 'sc',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'before expiry',
                                    style: TextStyle(
                                      fontFamily: 'sc',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: w * 0.40, top: h * 0.04),
                            child: Container(
                              height: h * 0.05,
                              width: w * 0.50,
                              decoration: BoxDecoration(
                                color: CustomColors.primary,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Text(
                                'Extend Validity',
                                style: TextStyle(
                                  fontFamily: 'sc',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Upcoming Tab Content
class FreecouseTab extends StatefulWidget {
  const FreecouseTab({Key? key}) : super(key: key);

  @override
  State<FreecouseTab> createState() => _FreecouseTabState();
}

class _FreecouseTabState extends State<FreecouseTab> {
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

class BatchcourseTab extends StatefulWidget {
  const BatchcourseTab({Key? key}) : super(key: key);

  @override
  State<BatchcourseTab> createState() => _BatchcourseTabState();
}

class _BatchcourseTabState extends State<BatchcourseTab> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    // Obtain the screen dimensions using MediaQuery
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Padding(
      padding:
          EdgeInsets.only(top: h * 0.02), // Top padding based on screen height
      child: Column(
        children: [
          // Display image
          Image.asset(
            'assets/icons/checklist 1.png',
            width: w * 0.3, // Width of the image as 50% of the screen width
          ),
          SizedBox(height: h * 0.01), // Spacing of 1% screen height
          // Display text
          Text(
            'No Batch Course.',
            style: TextStyle(
              fontSize: w * 0.05, // Font size 5% of the screen width
              fontFamily: 'sc',
              color: const Color(0xffFD1010),
            ),
          ),
          SizedBox(height: h * 0.02),
        ],
      ),
    );
  }

  // Helper method to build step text
  Widget _buildStepText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.01),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'sc',
          fontSize: w * 0.04,
          color: Colors.grey,
        ),
      ),
    );
  }
}
