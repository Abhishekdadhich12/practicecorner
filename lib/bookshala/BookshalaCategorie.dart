import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/bookshala/Bookshalacategoriesdetailpage.dart';
import 'package:practisecorner/screens/bottombar/bottom_bar.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class BookshalaCategories extends StatefulWidget {
  const BookshalaCategories({super.key});

  @override
  State<BookshalaCategories> createState() => _BookshalaCategoriesState();
}

class _BookshalaCategoriesState extends State<BookshalaCategories> {
  late double h, w;
  List<String> title = [
    'Kumar Ravi Sir Books',
    'REET Exam Books',
    'Popular Items',
    'Magazines',
    'Rajasthan Exams Books',
    'Rajasthan Civil Books',
    'U.P. Civil Books',
    'SSC/Bank Exam Books',
    'Railway Exam Books',
    'UP Govt. Exam Books',
    'Nursing Exam Books',
    'Agriculture Exam Books',
    'CLAT & Law Exam Books',
    'School',
    'NEET/JEE Exam Books',
    'UPSC/State PCS Exam Books',
    'MP Govt.Exam Books'
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
          body: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.leftToRight, // Smooth entry
                  child:
                      Bookshalacategoriesdetalpage(), // Replace with your next screen
                  duration: Duration(milliseconds: 500),
                  reverseDuration: Duration(milliseconds: 300),
                ),
              );
            },
            child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: h * 0.09,
                      width: w * 0.90,
                      decoration: BoxDecoration(
                          color: CustomColors.Second,
                          borderRadius: BorderRadius.circular(9)),
                      child: ListTile(
                        title: Text(
                          title[index],
                          style: TextStyle(
                            fontFamily: 'sc',
                            fontSize: 17,
                          ),
                        ),
                      )),
                );
              },
            ),
          )),
    );
  }
}
