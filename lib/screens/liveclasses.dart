import 'package:flutter/material.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Liveclasses extends StatefulWidget {
  const Liveclasses({super.key});

  @override
  State<Liveclasses> createState() => _LiveclassesState();
}

class _LiveclassesState extends State<Liveclasses> {
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
            'Classes',
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
                text: 'Live Classes',
              ),
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Widgets for each tab
            LiveClassesTab(),
            UpcomingTab(),
            CompletedTab(),
          ],
        ),
      ),
    );
  }
}

class LiveClassesTab extends StatefulWidget {
  const LiveClassesTab({Key? key}) : super(key: key);

  @override
  State<LiveClassesTab> createState() => _LiveClassesTabState();
}

class _LiveClassesTabState extends State<LiveClassesTab> {
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
            'assets/icons/liveshow.png',
            // Width of the image as 50% of the screen width
          ),
          SizedBox(height: h * 0.01), // Spacing of 2% screen height
          Text(
            'No Ongoing live Classes.',
            style: TextStyle(
                fontSize: w * 0.05, // Font size 5% of the screen width
                fontFamily: 'sc',
                color: const Color(0xffFD1010)),
          ),
          SizedBox(
            height: h * 0.08,
          ),
          Container(
            height: h * 0.50,
            width: w,
            decoration: const BoxDecoration(color: Color(0xf7B7878)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Free Videos',
                    style: TextStyle(fontFamily: 'sc', fontSize: 23),
                  ),
                  Container(
                    height: h * 0.12,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'How to Add Course',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        Image.asset(
                          'assets/icons/download 7.png',
                          height: h * 0.15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.12,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'How to take a live Class',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        Image.asset(
                          'assets/icons/download 8.png',
                          height: h * 0.15,
                        )
                      ],
                    ),
                  )
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
            'assets/icons/liveshow.png',
            // Width of the image as 50% of the screen width
          ),
          SizedBox(height: h * 0.01), // Spacing of 2% screen height
          Text(
            'No Upcoming live Classes.',
            style: TextStyle(
                fontSize: w * 0.05, // Font size 5% of the screen width
                fontFamily: 'sc',
                color: const Color(0xffFD1010)),
          ),
          SizedBox(
            height: h * 0.08,
          ),
          Container(
            height: h * 0.50,
            width: w,
            decoration: const BoxDecoration(color: Color(0xf7B7878)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Free Videos',
                    style: TextStyle(fontFamily: 'sc', fontSize: 23),
                  ),
                  Container(
                    height: h * 0.12,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'How to Add Course',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        Image.asset(
                          'assets/icons/download 7.png',
                          height: h * 0.15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.12,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'How to take a live Class',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        Image.asset(
                          'assets/icons/download 8.png',
                          height: h * 0.15,
                        )
                      ],
                    ),
                  )
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
            'assets/icons/liveshow.png',
            // Width of the image as 50% of the screen width
          ),
          SizedBox(height: h * 0.01), // Spacing of 2% screen height
          Text(
            'No live Classes Completed.',
            style: TextStyle(
                fontSize: w * 0.05, // Font size 5% of the screen width
                fontFamily: 'sc',
                color: const Color(0xffFD1010)),
          ),
          SizedBox(
            height: h * 0.08,
          ),
          Container(
            height: h * 0.50,
            width: w,
            decoration: const BoxDecoration(color: Color(0xf7B7878)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Free Videos',
                    style: TextStyle(fontFamily: 'sc', fontSize: 23),
                  ),
                  Container(
                    height: h * 0.12,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'How to Add Course',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        Image.asset(
                          'assets/icons/download 7.png',
                          height: h * 0.15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.12,
                    width: w * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'How to take a live Class',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        Image.asset(
                          'assets/icons/download 8.png',
                          height: h * 0.15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
