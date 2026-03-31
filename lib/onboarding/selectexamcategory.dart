import 'package:flutter/material.dart';
import 'package:practisecorner/screens/bottombar/bottom_bar.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Selectexamcategory extends StatefulWidget {
  const Selectexamcategory({super.key});

  @override
  State<Selectexamcategory> createState() => _SelectexamcategoryState();
}

class _SelectexamcategoryState extends State<Selectexamcategory> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
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
                    height: h * 0.10,
                  ),
                  const Text(
                    'Practice Corner',
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
          SizedBox(height: h * 0.03),
          // Title Section
          Padding(
            padding: EdgeInsets.only(left: w * 0.05),
            child: Text(
              'Select Exam Category',
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'sc',
                color: CustomColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: w * 0.05),
            child: Container(
              height: h * 0.001,
              width: w * 0.55,
              color: CustomColors.primary,
            ),
          ),
          // ListView Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildCategoryContainer('GOVERNMENT EXAM', Color(0xFFCEAEC1)),
                _buildCategoryContainer('NURSING', Color(0xFF8A8608)),
                _buildCategoryContainer('NEET/JEE', Color(0xFFF44336)),
                _buildCategoryContainer('DEFENCE', Color(0xFF0C088A)),
                _buildCategoryContainer('CLAT & Law exam', Color(0xFF8A0869)),
                _buildCategoryContainer('ENGINEERING', Color(0xFFD992CF)),
                _buildCategoryContainer('CUET', Color(0xFFF2B200)),
                _buildCategoryContainer('AGRICULTURE', Color(0xFFEC017E)),
                _buildCategoryContainer(
                  'UPDATE PREFERENCE',
                  Colors.white,
                  isOutlined: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(String title, Color color,
      {bool isOutlined = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Bottombar()));
        },
        child: Container(
          height: h * 0.055,
          width: w * 0.95,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(9),
            border: isOutlined ? Border.all(color: Colors.black) : null,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'sc',
              fontSize: 16,
              color: isOutlined ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
