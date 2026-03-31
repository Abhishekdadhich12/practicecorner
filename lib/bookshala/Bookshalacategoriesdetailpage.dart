import 'package:flutter/material.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Bookshalacategoriesdetalpage extends StatefulWidget {
  const Bookshalacategoriesdetalpage({super.key});

  @override
  State<Bookshalacategoriesdetalpage> createState() =>
      _BookshalacategoriesdetalpageState();
}

class _BookshalacategoriesdetalpageState
    extends State<Bookshalacategoriesdetalpage> {
  late double h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.Second,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        title: const Text(
          'Bookशाला',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'sc', // Make sure this font is available
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.038),
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
          children: [
            Container(
                height: h * 0.08,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.04,
                        width: w * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/filter (2).png',
                                height: h * 0.02,
                                width: w * 0.09,
                              ),
                              Text(
                                'Filter',
                                style:
                                    TextStyle(fontFamily: 'sc', fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.04,
                        width: w * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/sort-by.png',
                              height: h * 0.02,
                              width: w * 0.09,
                            ),
                            Text(
                              'Sort By',
                              style: TextStyle(fontFamily: 'sc', fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6, // Number of items in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10, // Horizontal space between items
                    mainAxisSpacing: 10, // Vertical space between items
                    childAspectRatio: 0.65),
                itemBuilder: (context, index) {
                  List<String> imagePaths = [
                    'assets/icons/pc1.jpeg',
                    'assets/icons/pc2.jpeg',
                    'assets/icons/pc3.jpeg',
                    'assets/icons/pc4.jpeg',
                    'assets/icons/pc5.jpeg',
                    'assets/icons/pc7.jpeg',
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
          ],
        ),
      ),
    );
  }
}
