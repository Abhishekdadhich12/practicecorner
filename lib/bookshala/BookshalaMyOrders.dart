import 'package:flutter/material.dart';
import 'package:practisecorner/screens/bottombar/bottom_bar.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:practisecorner/utills/custom_text.dart';

class BookshalaMyorders extends StatefulWidget {
  const BookshalaMyorders({super.key});

  @override
  State<BookshalaMyorders> createState() => _BookshalaMyordersState();
}

class _BookshalaMyordersState extends State<BookshalaMyorders> {
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  prefixIcon:
                      const Icon(Icons.search, color: CustomColors.primary),
                  hintText: 'Search Your Order'),
            ),
            Center(
              child: Image.asset(
                'assets/icons/bxs_cart.png',
                height: h * 0.30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
