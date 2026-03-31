import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/bookshala/Bookshalabuypage.dart';
import 'package:practisecorner/screens/bottombar/bottom_bar.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class BookshalaHome extends StatefulWidget {
  const BookshalaHome({super.key});

  @override
  State<BookshalaHome> createState() => _BookshalaHomeState();
}

class _BookshalaHomeState extends State<BookshalaHome> {
  late double h, w;

  final List<String> imagepaths = [
    'assets/icons/pc1.jpeg',
    'assets/icons/pc2.jpeg',
    'assets/icons/pc3.jpeg',
    'assets/icons/pc4.jpeg',
    'assets/icons/pc5.jpeg',
    'assets/icons/pc6.jpeg',
    'assets/icons/pc7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Bottombar()));
        return false; // Prevents default back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primary,
          title: const Text(
            'Bookशाला',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'sc',
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.038),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  // barrierColor: Color(9),
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Confirm Exit',
                      style: TextStyle(fontFamily: 'sc', fontSize: 19),
                    ),
                    content: const Text(
                      'Are you sure you want to exit from Bookशाला?',
                      style: TextStyle(fontFamily: 'sc', fontSize: 15),
                    ),
                    actions: [
                      Container(
                        height: h * 0.04,
                        width: w * 0.20,
                        decoration: BoxDecoration(
                            color: CustomColors.Second,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(9)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                                fontFamily: 'sc', color: Colors.black),
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Bottombar())); // Exit the current screen
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bottombar()));
                          },
                          child: Container(
                            height: h * 0.04,
                            width: w * 0.27,
                            decoration: BoxDecoration(
                                color: CustomColors.primary,
                                borderRadius: BorderRadius.circular(9)),
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                  fontFamily: 'sc', color: Colors.black),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: CircleAvatar(
                radius: h * 0.02,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: CustomColors.primary,
                  size: h * 0.02,
                ),
              ),
            ),
          ),
          actions: [
            SizedBox(
              width: w * 0.45,
              height: h * 0.05,
              child: Padding(
                padding: EdgeInsets.only(right: w * 0.04),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search Product',
                    contentPadding:
                        EdgeInsets.only(top: h * 0.008, left: w * 0.02),
                    hintStyle: const TextStyle(
                      color: Color(0xFF7B7878),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    suffixIcon:
                        const Icon(Icons.search, color: CustomColors.primary),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B7878))),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B7878))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B7878))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B7878))),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B7878))),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7B7878))),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * 0.15,
                width: w,
                decoration: BoxDecoration(color: CustomColors.Second),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagepaths.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                      child: Image.asset(
                        imagepaths[index],
                        height: h * 0.12,
                        width: w * 0.20,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Popular Books For You',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        type: PageTransitionType.leftToRight, // Smooth entry
                        child:
                            Bookshalabuypage(), // Replace with your next screen
                        duration: Duration(milliseconds: 500),
                        reverseDuration: Duration(milliseconds: 300),
                      ),
                    );
                  },
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
                            childAspectRatio: 0.65),
                    itemBuilder: (context, index) {
                      List<String> imagePaths = [
                        'assets/icons/pc1.jpeg',
                        'assets/icons/pc2.jpeg',
                        'assets/icons/pc3.jpeg',
                        'assets/icons/pc4.jpeg',
                        'assets/icons/pc5.jpeg',
                        'assets/icons/pc6.jpeg',
                      ];
                      return Container(
                        height: 500,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.grey, width: 0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Center horizontally
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
                                      0.41, // Make the image fill the width of the container
                                  fit: BoxFit
                                      .contain, // Ensure the image covers the available space
                                ),
                              ),
                              const SizedBox(
                                  height: 10), // Space between image and text
                              const Text(
                                'Current Affairs Varshilank', // Replace with your text
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'sc',
                                ),
                                // Center-align the text
                              ),
                              const Text(
                                '2025', // Replace with your text
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'sc',
                                ),
                                // Center-align the text
                              ),
                              SizedBox(
                                height: h * 0.02,
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Popular Rajasthan Exams Books',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        type: PageTransitionType.leftToRight, // Smooth entry
                        child:
                            Bookshalabuypage(), // Replace with your next screen
                        duration: Duration(milliseconds: 500),
                        reverseDuration: Duration(milliseconds: 300),
                      ),
                    );
                  },
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
                            childAspectRatio: 0.65),
                    itemBuilder: (context, index) {
                      List<String> imagePaths = [
                        'assets/icons/pc1.jpeg',
                        'assets/icons/pc2.jpeg',
                        'assets/icons/pc3.jpeg',
                        'assets/icons/pc4.jpeg',
                        'assets/icons/pc5.jpeg',
                        'assets/icons/pc6.jpeg',
                      ];
                      return Container(
                        height: 500,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.grey, width: 0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Center horizontally
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
                                      0.41, // Make the image fill the width of the container
                                  fit: BoxFit
                                      .contain, // Ensure the image covers the available space
                                ),
                              ),
                              const SizedBox(
                                  height: 10), // Space between image and text
                              const Text(
                                'Current Affairs Varshilank', // Replace with your text
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'sc',
                                ),
                                // Center-align the text
                              ),
                              const Text(
                                '2025', // Replace with your text
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'sc',
                                ),
                                // Center-align the text
                              ),
                              SizedBox(
                                height: h * 0.02,
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
        ),
      ),
    );
  }
}
