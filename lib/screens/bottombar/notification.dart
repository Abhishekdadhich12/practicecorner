import 'package:flutter/material.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Notificationbar extends StatefulWidget {
  const Notificationbar({super.key});

  @override
  State<Notificationbar> createState() => _NotificationbarState();
}

class _NotificationbarState extends State<Notificationbar> {
  late double h, w;
  int activeIndex = 0;
  final List<String> tabs = ['All', 'Video', 'Test', 'General'];

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
          'Notification',
          style: TextStyle(color: Colors.white, fontFamily: 'sc', fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: h * 0.04,
              width: w * 0.23,
              decoration: BoxDecoration(
                color: CustomColors.primary,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(9),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Mark as Read',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sc',
                  fontSize: 9,
                ),
              ),
            ),
          ),
        ],
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
                  width: w * 0.22,
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
                VideoScreen(),
                TestScreen(),
                GeneralScreen(),
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
  // List of items to display different content for each container
  final List<Map<String, String>> items = [
    {
      'title': 'Coupon Awarded',
      'description': 'You have been awarded with Coupon UC10...',
      'dateTime': '2025-01-10 10:30 AM'
    },
    {
      'title': 'Bonus Awarded',
      'description': 'You have received a bonus for completing...',
      'dateTime': '2025-01-09 03:15 PM'
    },
    {
      'title': 'Gift Card',
      'description': 'Your gift card worth 50 is available...',
      'dateTime': '2025-01-08 01:00 PM'
    },
    {
      'title': 'Promotion',
      'description': 'Congratulations! You are promoted to...',
      'dateTime': '2025-01-07 04:20 PM'
    },
  ];

  // Track expanded states for each item
  List<bool> isExpandedList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          bool isExpanded = isExpandedList[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            height: isExpanded
                ? 150
                : 90, // Adjust height based on the expansion state
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: const TextStyle(fontFamily: 'sc', fontSize: 18),
                  ),
                  const Text(
                    'Congratulations !...',
                    style: TextStyle(fontFamily: 'sc', fontSize: 11),
                  ),
                  // Conditionally show the expanded content
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        item['description']!,
                        style: const TextStyle(fontFamily: 'sc', fontSize: 11),
                      ),
                    ),
                  // "See more" or "See less" button at the bottom
                  const Spacer(), // Push the button to the bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['dateTime']!,
                        style: const TextStyle(fontFamily: 'sc', fontSize: 11),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Toggle between expanded and collapsed for the current item
                            isExpandedList[index] = !isExpanded;
                          });
                        },
                        child: Text(
                          isExpanded ? 'See less' : 'See more',
                          style: const TextStyle(
                            fontFamily: 'sc',
                            fontSize: 11,
                            color: CustomColors.primary, // Button color
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Image.asset('assets/icons/VIDEO.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 75,
            ),
            child: Text(
              'No video notification found',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'sc', color: Color(0XFffFD1010)),
            ),
          )
        ],
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 150, top: 78),
          child: Image.asset('assets/icons/VIDEO.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'No Test found',
            style: TextStyle(
                fontSize: 16, fontFamily: 'sc', color: Color(0XFffFD1010)),
          ),
        )
      ],
    );
  }
}

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Expanded ensures the ListView takes available space
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0), // Add spacing between containers
              height: 100,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: CustomColors.primary),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' सूचना  ',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' प्रिय विद्यार्थियों... ',
                      style: TextStyle(fontFamily: 'sc', fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '5 January 2025',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
