import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practisecorner/onboarding/otpscreen.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Loginwithnumber extends StatefulWidget {
  const Loginwithnumber({super.key});

  @override
  State<Loginwithnumber> createState() => _LoginwithnumberState();
}

class _LoginwithnumberState extends State<Loginwithnumber> {
  late double h, w;
  bool isChecked = false;
  int currentIndex = 0;
  TextEditingController phoneController = TextEditingController();

  final List<String> images = [
    'assets/icons/bn1.png',
    'assets/icons/bn2.png',
    'assets/icons/bn4.png'
  ];
  final List<String> sliderTexts = [
    "Learning Largest Destination",
    "Highest Success Numbers",
    "Unmatched Test & Videos Classess"
  ];

  bool isPhoneNumberValid() {
    String phoneNumber = phoneController.text;
    return phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
  }

  void onChanged(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: h * 0.20,
              width: w,
              decoration: const BoxDecoration(
                color: CustomColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.10, left: w * 0.04),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/newlogo.png',
                      height: h * 0.09,
                    ),
                    const Text(
                      ' Welcome To Practice Corner',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: 'sc',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.05),

            // Carousel Slider
            Column(
              children: [
                CarouselSlider(
                  items: images.map((imagePath) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: h * 0.19,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: h * 0.02),
                Text(
                  sliderTexts[
                      currentIndex], // Dynamically updates based on image
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'sc',
                  ),
                ),

                SizedBox(height: h * 0.02),

                // Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 10,
                      width: currentIndex == index ? 20 : 10,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? CustomColors.primary
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: h * 0.02),

            // Welcome Text

            Container(
              height: h * 0.001,
              width: w * 0.78,
              color: CustomColors.primary,
            ),
            SizedBox(height: h * 0.02),

            // Mobile Number Input Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: SizedBox(
                height: h * 0.06,
                width: w * 0.9,
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (value) {
                    setState(() {}); // Refresh UI on digit input
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/india.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "+91",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: w * 0.01),
                          const VerticalDivider(
                            width: 1,
                            thickness: 2,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: CustomColors.primary),
                    ),
                    hintText: "Enter your mobile number",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'sc',
                      fontWeight: FontWeight.bold,
                    ),
                    counterText: "",
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.08),

            // Button with Gradual Fill Effect
            Padding(
              padding: EdgeInsets.only(left: w * 0.02),
              child: GestureDetector(
                onTap: isPhoneNumberValid()
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Otpscreen()));
                      }
                    : null,
                child: Stack(
                  children: [
                    // Background Container
                    Container(
                      height: h * 0.06,
                      width: w * 0.94,
                      decoration: BoxDecoration(
                        color: const Color(0xFF92D9D2),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    // Filling Effect
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: h * 0.06,
                      width: w * 0.94 * (phoneController.text.length / 10),
                      decoration: BoxDecoration(
                        color: CustomColors.primary,
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    // Button Text
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 24,
                              color: Colors.white.withOpacity(
                                  phoneController.text.length == 10
                                      ? 1.0
                                      : 0.5),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  10), // Add some spacing between text and icon
                          Icon(
                            Icons.arrow_forward, // Corrected the icon name
                            color: Colors.white.withOpacity(
                                phoneController.text.length == 10 ? 1.0 : 0.5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
