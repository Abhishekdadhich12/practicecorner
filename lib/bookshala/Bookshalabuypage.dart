import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/purchasecourcesclass/buynowcourse.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:practisecorner/utills/custom_text.dart';

class Bookshalabuypage extends StatefulWidget {
  const Bookshalabuypage({super.key});

  @override
  State<Bookshalabuypage> createState() => _BookshalabuypageState();
}

class _BookshalabuypageState extends State<Bookshalabuypage> {
  late double h, w;
  int currentQuantity = 1; // Default quantity

  // Example image list
  final List<String> imagePaths = [
    'assets/icons/pc1.jpeg',
    'assets/icons/pc2.jpeg',
    'assets/icons/pc3.jpeg',
    'assets/icons/pc4.jpeg',
    'assets/icons/pc5.jpeg',
    'assets/icons/pc6.jpeg',
    'assets/icons/pc7.jpeg',
  ];
  int currentImageIndex = 0; // To track the currently selected image
  final ScrollController _scrollController = ScrollController();

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
              fontFamily: 'sc',
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.038),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.40,
                  width: w,
                  decoration: BoxDecoration(
                    color: CustomColors.Second,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Vertical Thumbnail List with Arrows
                      Column(
                        children: [
                          // Up Arrow
                          if (_scrollController.hasClients &&
                              _scrollController.offset > 0)
                            GestureDetector(
                              onTap: () {
                                _scrollController.animateTo(
                                  _scrollController.offset - h * 0.1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                height: h * 0.02,
                                width: w * 0.20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3)),
                                child: const Icon(
                                  Icons.arrow_drop_up_rounded,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                            ),
                          // Thumbnail List
                          Expanded(
                            child: Container(
                              width: w * 0.20,
                              decoration: const BoxDecoration(
                                color: CustomColors.Second,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: ListView.builder(
                                controller: _scrollController,
                                itemCount: imagePaths.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentImageIndex = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: h * 0.01,
                                        horizontal: w * 0.01,
                                      ),
                                      child: Container(
                                        height: h * 0.08,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: currentImageIndex == index
                                                ? CustomColors.primary
                                                : Colors.transparent,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Image.asset(
                                          imagePaths[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          // Down Arrow
                          if (_scrollController.hasClients &&
                              _scrollController.offset <
                                  _scrollController.position.maxScrollExtent)
                            GestureDetector(
                              onTap: () {
                                _scrollController.animateTo(
                                  _scrollController.offset + h * 0.1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                height: h * 0.02,
                                width: w * 0.20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3)),
                                child: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                              ),
                            ),
                        ],
                      ),
                      // Large Image Display with Animation
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(w * 0.02),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              imagePaths[currentImageIndex],
                              key: ValueKey<int>(
                                  currentImageIndex), // Unique key to detect changes
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Text(
                  'Current Affairs Varshikank 2025',
                  style: TextStyle(fontFamily: 'sc', fontSize: 19),
                ),
                Text(
                  'By Practice Corner',
                  style: TextStyle(fontFamily: 'sc', fontSize: 13),
                ),
                Row(
                  children: [
                    Text(
                      '₹ 108',
                      style: TextStyle(fontFamily: 'sc', fontSize: 26),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Text(
                      '₹ 120',
                      style: TextStyle(
                        fontFamily: 'sc',
                        color: Colors.grey,
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.04,
                    ),
                    Text(
                      '(10% OFF)',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 20,
                          color: CustomColors.primary),
                    ),
                  ],
                ),
                Text(
                  'In Stock',
                  style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 17,
                      color: CustomColors.primary,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity :',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: h * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: DropdownButton<int>(
                        value: currentQuantity,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        underline: Container(
                          height: h * 0.05,
                          width: w * 0.08,
                        ),
                        onChanged: (int? newValue) {
                          setState(() {
                            currentQuantity = newValue!;
                          });
                        },
                        items: List.generate(3, (index) => index + 1)
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  'Check Delivery/cash on Delivery Availability',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                customTextField(
                    hintText: 'Enter Pincode',
                    prefixIcon: Icon(Icons.location_pin)),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  'करेंट अफेयर्स 2024 वार्षिकांक',
                  style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  'यह पुस्तक "करेंट अफेयर्स 2024 वार्षिकांक" प्रतियोगी परीक्षाओं के लिए एक अनमोल संसाधन है। इसमें जनवरी 2024 से दिसंबर 2024 तक की सभी प्रमुख घटनाओं को विस्तृत और व्यवस्थित रूप से शामिल किया गया है।',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  'पुस्तक की मुख्य विशेषताएँ:',
                  style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' 1. यह पुस्तक  क्लास के लोकप्रिय शिक्षक कुमार सर द्वारा संकलित है।',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' 2 .राष्ट्रीय और अंतर्राष्ट्रीय परिदृश्य, चर्चित व्यक्तित्व, योजनाएँ/मिशन/अभियान, विज्ञान, प्रौद्योगिकी, और पर्यावरण से संबंधित विषयों को शामिल किया गया है।',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  '3. वर्ष 2024 के 2222+ वन लाइनर प्रश्नों का संग्रह, जो सभी प्रमुख परीक्षाओं के लिए उपयोगी है।',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  'विषयों की सूची:',
                  style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -राष्ट्रीय एवं अंतर्राष्ट्रीय परिदृश्य',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -आर्थिक एवं खेल परिदृश्य',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -चर्चित व्यक्तित्व',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -योजनाएँ/मिशन/अभियान',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -योजनाएँ/मिशन/अभियान',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -योजनाएँ/मिशन/अभियान',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -योजनाएँ/मिशन/अभियान',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  ' -योजनाएँ/मिशन/अभियान',
                  style: TextStyle(
                    fontFamily: 'sc',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  'पुस्तक विवरण:',
                  style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'किताबों की संख्या :',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontFamily: 'sc',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'पृष्ठों की संख्या: :',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      '1000',
                      style: TextStyle(
                        fontFamily: 'sc',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'भाषा :',
                      style: TextStyle(
                          fontFamily: 'sc',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      'हिंदी',
                      style: TextStyle(
                        fontFamily: 'sc',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.09,
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: EdgeInsets.zero, // Remove padding around the buttons
            child: SizedBox(
              width: MediaQuery.of(context).size.width, // Full screen width
              child: Material(
                elevation: 3,
                shadowColor: Colors.black,
                child: Container(
                  height: h * 0.10,
                  width: w,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: h * 0.05,
                                width: w * 0.40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                        color: Colors.orange, width: 1)),
                                child: Text(
                                  'Add to Bag',
                                  style: TextStyle(
                                      fontFamily: 'sc',
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                alignment: Alignment.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageTransition(
                                      type: PageTransitionType
                                          .rightToLeft, // Smooth entry
                                      child:
                                          Buycourse(), // Replace with your next screen
                                      duration: Duration(milliseconds: 500),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: h * 0.05,
                                  width: w * 0.40,
                                  decoration: BoxDecoration(
                                    color: CustomColors.primary,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Text(
                                    'Buy',
                                    style: TextStyle(
                                        fontFamily: 'sc',
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )));
  }
}
