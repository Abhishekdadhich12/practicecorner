import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practisecorner/purchasecourcesclass/starttest.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:marquee/marquee.dart';

class Attemptquiz extends StatefulWidget {
  const Attemptquiz({super.key});

  @override
  State<Attemptquiz> createState() => _AttemptquizState();
}

class _AttemptquizState extends State<Attemptquiz> {
  late double h, w;
  String selectedLanguage = 'English';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.Second,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: SizedBox(
          height: 30, // Adjust height as needed
          child: Marquee(
            text: 'Complete Quiz || संधि',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'sc',
              fontSize: 22,
            ),
            scrollAxis: Axis.horizontal,
            blankSpace: 20.0,
            velocity: 50.0,
            startPadding: 10.0,
            accelerationDuration: const Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: const Duration(seconds: 1),
            decelerationCurve: Curves.easeOut,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.16,
              width: w * 0.95,
              decoration: BoxDecoration(
                color: CustomColors.Second,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Number Of Questions :',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        SizedBox(width: w * 0.09),
                        const Text(
                          '60',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Time (in Minutes) :',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        SizedBox(width: w * 0.16),
                        const Text(
                          '60',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'No. of Section :',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                        SizedBox(width: w * 0.24),
                        const Text(
                          '1',
                          style: TextStyle(fontFamily: 'sc', fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Header row for the bottom section
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Table Layout
            Container(
              width: w * 0.99,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 0,
                ),
                columnWidths: const {
                  0: FractionColumnWidth(0.1),
                  1: FractionColumnWidth(0.15),
                  2: FractionColumnWidth(0.2),
                  3: FractionColumnWidth(0.2),
                  4: FractionColumnWidth(0.2),
                  5: FractionColumnWidth(0.15),
                },
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Section Name',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Total Questions',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Max Attempt Ques.',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Negative Marks',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Marks/Ques',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Total Time',
                            style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'GK',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '50',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '10',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '0',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '60',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Row(
              children: [
                const Text(
                  'Language',
                  style: TextStyle(fontFamily: 'sc', fontSize: 20),
                ),
                SizedBox(
                    width: w *
                        0.05), // Adds spacing between the label and the dropdown
                Container(
                  height: h * 0.05,
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedLanguage,
                      alignment: Alignment.center,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      items: ['English', 'Hindi'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontFamily: 'sc',
                                fontSize: 20,
                                color: CustomColors.primary,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLanguage = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.03,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'I have read and understood the instructions. I agree that in case of not adhering to the exam instructions, I will be disqualified.',
                    style: TextStyle(fontFamily: 'sc', fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: h * 0.28),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.rightToLeft, // Smooth entry
                      child: StartTest(), // Replace with your next screen
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 300),
                    ),
                  );
                },
                child: Container(
                  height: h * 0.07,
                  width: w * 1,
                  decoration: BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.circular(9)),
                  child: const Text(
                    'Start Test',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 24, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
