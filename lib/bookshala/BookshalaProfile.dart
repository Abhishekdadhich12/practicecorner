import 'package:flutter/material.dart';
import 'package:practisecorner/screens/bottombar/bottom_bar.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:practisecorner/utills/custom_text.dart';

class BookshalaProfile extends StatefulWidget {
  const BookshalaProfile({super.key});

  @override
  State<BookshalaProfile> createState() => _BookshalaProfileState();
}

class _BookshalaProfileState extends State<BookshalaProfile> {
  late double h, w;
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/icons/user (1).png',
                  height: h * 0.20,
                ),
              ),
              Text(
                'Profile Detail',
                style: TextStyle(fontFamily: 'sc', fontSize: 20),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Container(
                    height: h * 0.001,
                    width: w * 0.50,
                    color: Colors.grey,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Practice Corner',
                    style: TextStyle(fontFamily: 'sc', fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mobile ',
                    style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '123567890',
                    style: TextStyle(fontFamily: 'sc', fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email ',
                    style: TextStyle(
                      fontFamily: 'sc',
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Tdh@gmail.com',
                    style: TextStyle(fontFamily: 'sc', fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                children: [
                  Text(
                    'Academic Details',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Container(
                    height: h * 0.001,
                    width: w * 0.46,
                    color: Colors.grey,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
