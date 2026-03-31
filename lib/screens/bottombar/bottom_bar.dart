import 'package:flutter/material.dart';
import 'package:practisecorner/bookshala/BookshalaBottomBar.dart';
import 'package:practisecorner/screens/bottombar/createtest.dart';
import 'package:practisecorner/screens/bottombar/feeds.dart';
import 'package:practisecorner/screens/bottombar/liveclass.dart';
import 'package:practisecorner/screens/bottombar/notification.dart';
import 'package:practisecorner/screens/bottombar/shop.dart';
import 'package:practisecorner/utills/custom_button.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:practisecorner/utills/custom_text.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  late double h, w;

  int currentIndex = 0;

  final List<Widget> pages = [
    const Shop(),
    const Createtest(),
    const Notificationbar(),
    const Feeds(),
    const Liveclass(),
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: currentIndex != 3 // Show the page unless it's Feeds
          ? pages[currentIndex]
          : const SizedBox.shrink(), // Empty placeholder for Feeds
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 1; // Navigate to "Create Test" when pressed
          });
        },
        backgroundColor: CustomColors.primary,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.0,
        color: CustomColors.primary,
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home_outlined, "Shop", 0),
              _buildNavItem(Icons.notifications_outlined, "Notifications", 2),
              const SizedBox(width: 40), // Space for FAB
              GestureDetector(
                onTap: () =>
                    _openFeedsBottomSheet(context), // Open Bottom Sheet
                child: _buildNavItem(Icons.wifi, "Feeds", 3),
              ),
              _buildNavItem(Icons.book_online_sharp, "Bookशाला", 4)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        if (index != 3) {
          setState(() {
            currentIndex = index;
          });
        } else {
          _openFeedsBottomSheet(context);
        }
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookBottomBar(
                currentIndex: 0,
              ),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: isSelected ? 28 : 24,
              color: Colors.white), // Set icons color to white
          Text(
            label,
            style: TextStyle(
              fontFamily: 'sc',
              fontSize: isSelected ? 16 : 12,
              color: Colors.white, // Set text color to white
            ),
          ),
        ],
      ),
    );
  }

  void _openFeedsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Allow transparent background
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                // Main content of the modal
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'Fill the required details',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'sc',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'To Continue your purchase Please fill these fields',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'sc',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: customTextFieldFrofile(
                            hintText: 'Name',
                            maxLength: 10,
                            keyboardType: TextInputType.name,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: CustomColors.primary,
                            ),
                          ),
                        ),
                        customTextFieldFrofile(
                          hintText: 'Email ID',
                          maxLength: 30,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: CustomColors.primary,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        customTextFieldFrofile(
                          hintText: 'Phone Number',
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: CustomColors.primary,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        customTextFieldFrofile(
                          hintText: 'State',
                          maxLength: 10,
                          keyboardType: TextInputType.text,
                          prefixIcon: const Icon(
                            Icons.location_city,
                            color: CustomColors.primary,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        customTextFieldFrofile(
                          hintText: 'District',
                          maxLength: 10,
                          keyboardType: TextInputType.text,
                          prefixIcon: const Icon(
                            Icons.map,
                            color: CustomColors.primary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: custonButton(
                            context,
                            onTap: () {
                              // Add your functionality here
                            },
                            data: 'SUBMIT',
                            isloader: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Cross icon at the top center
                Positioned(
                  top: 0,
                  left: MediaQuery.of(context).size.width / 2 -
                      25, // Center the icon
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: CustomColors.primary,
                      child: const Icon(Icons.close,
                          color: Colors.white, size: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
