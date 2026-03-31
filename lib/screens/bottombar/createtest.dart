import 'package:flutter/material.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Createtest extends StatefulWidget {
  const Createtest({super.key});

  @override
  State<Createtest> createState() => _CreatetestState();
}

class _CreatetestState extends State<Createtest> {
  late double h, w;
  int activeIndex = 0;
  final List<String> tabs = ['Create Test', 'My Test', 'Shared Test'];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Create Test',
          style: TextStyle(color: Colors.white, fontFamily: 'sc', fontSize: 21),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: h * 0.035,
            width: w,
            decoration: const BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: h * 0.40,
              width: w * 0.95,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.03,
                  ),
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
                          height: h * 0.05,
                          width: w * 0.26,
                          decoration: BoxDecoration(
                            color:
                                isActive ? CustomColors.primary : Colors.white,
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
                              fontSize: 13,
                              color: isActive
                                  ? Colors.white
                                  : CustomColors.primary,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: activeIndex,
                      children: [
                        // Each tab content
                        Createtest1(),
                        Mytest(),
                        Sharedtest(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (activeIndex == 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.28,
                  width: w * 0.90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(9)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Want to Know How to buy Course ?',
                          style: TextStyle(fontFamily: 'sc', fontSize: 21),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Text(
                          'Step 1: Select a Course With tests available.',
                          style: TextStyle(fontFamily: 'sc', fontSize: 13),
                        ),
                        Text(
                          'Step 2: Read the Following details related to Course.',
                          style: TextStyle(fontFamily: 'sc', fontSize: 13),
                        ),
                        Text(
                          'Step 3: Select Payment Method and Pay .',
                          style: TextStyle(fontFamily: 'sc', fontSize: 13),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Container(
                          height: h * 0.05,
                          width: w * 0.40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: CustomColors.primary),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Watch Now',
                                  style: TextStyle(
                                      fontFamily: 'sc',
                                      fontSize: 15,
                                      color: Colors.white),
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
                                Icon(
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
                )
              ],
            )
        ],
      ),
    );
  }
}

class Createtest1 extends StatefulWidget {
  const Createtest1({super.key});

  @override
  State<Createtest1> createState() => _Createtest1State();
}

class _Createtest1State extends State<Createtest1> {
  late double h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomColors.Second,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/icons/createtest.png'),
              ),
              const Text(
                'No Test Created',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'sc', color: Color(0xffFD1010)),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                height: h * 0.04,
                width: w * 0.40,
                decoration: BoxDecoration(
                    color: CustomColors.primary,
                    borderRadius: BorderRadius.circular(9)),
                child: Text(
                  'Buy Course',
                  style: TextStyle(
                      fontSize: 17, fontFamily: 'sc', color: Colors.white),
                ),
                alignment: Alignment.center,
              )
            ],
          ),
        ));
  }
}

class Mytest extends StatefulWidget {
  const Mytest({super.key});

  @override
  State<Mytest> createState() => _MytestState();
}

class _MytestState extends State<Mytest> {
  late double h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomColors.Second,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/icons/mytest.png'),
              ),
              const Text(
                'No Test Found',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'sc', color: Color(0xffFD1010)),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                'Your Saved tests will be displayed here.',
                style: TextStyle(
                    fontSize: 13, fontFamily: 'sc', color: Colors.grey),
              ),
            ],
          ),
        ));
  }
}

class Sharedtest extends StatefulWidget {
  const Sharedtest({super.key});

  @override
  State<Sharedtest> createState() => _SharedtestState();
}

class _SharedtestState extends State<Sharedtest> {
  late double h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomColors.Second,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/icons/mytest.png'),
              ),
              const Text(
                'No  ShareTest Found',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'sc', color: Color(0xffFD1010)),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                'Your Shared Test will be displayed here.',
                style: TextStyle(
                    fontSize: 13, fontFamily: 'sc', color: Colors.grey),
              ),
            ],
          ),
        ));
  }
}
