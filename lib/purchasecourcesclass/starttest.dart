import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practisecorner/purchasecourcesclass/attemptquiz.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:marquee/marquee.dart';

class StartTest extends StatefulWidget {
  const StartTest({super.key});

  @override
  State<StartTest> createState() => _StartTestState();
}

class _StartTestState extends State<StartTest> {
  late double h, w;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentQuestionIndex = 0;
  Map<int, int?> selectedAnswers = {};
  Map<int, bool> markedForReview = {};
  Timer? _timer;
  int _timeLeft = 60;
  Map<int, String> questionStatus = {};
  void _submitTest() {
    // Handle test submission logic here
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Submit Test",
            style: TextStyle(fontFamily: 'sc', color: Colors.black),
          ),
          content: const Text(
            "Are you sure you want to submit your test?",
            style: TextStyle(fontFamily: 'sc', color: Colors.black),
          ),
          actions: [
            Container(
              height: h * 0.05,
              width: w * 0.20,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(9)),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontFamily: 'sc', color: Colors.red),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Attemptquiz()));
              },
              child: Container(
                height: h * 0.05,
                width: w * 0.20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9)),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: 'sc', color: CustomColors.primary),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  final List<Map<String, dynamic>> questions = List.generate(50, (index) {
    return {
      'question':
          'Question ${index + 1}: किस विकल्प में  व्यंजन संधि नहीं है ?',
      'options': ['अन्वय', 'वाग्जाल', 'अजंत', 'इनमे से कोई नहीं '],
    };
  });

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < questions.length; i++) {
      questionStatus[i] = 'Not Visited';
    }
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer?.cancel();
        _nextQuestion();
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        _timeLeft = 60;
      });
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        _timeLeft = 60;
      });
    }
  }

  void _markForReview() {
    setState(() {
      markedForReview[currentQuestionIndex] =
          !(markedForReview[currentQuestionIndex] ?? false);
      questionStatus[currentQuestionIndex] =
          markedForReview[currentQuestionIndex]!
              ? 'Mark for Review'
              : 'Attempted';
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: CustomColors.Second,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: SizedBox(
          height: h * 0.08,
          child: Marquee(
            text: 'Complete Quiz || संधि',
            style: const TextStyle(color: Colors.white, fontSize: 22),
            scrollAxis: Axis.horizontal,
            blankSpace: 20.0,
            velocity: 50.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: _buildRightDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Timer and Progress Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer,
                        color: CustomColors.primary, size: 29),
                    const SizedBox(width: 5),
                    Text("$_timeLeft s",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sc')),
                  ],
                ),
                Text(
                  "Questions: ${currentQuestionIndex + 1} / ${questions.length}",
                  style: const TextStyle(fontSize: 16, fontFamily: 'sc'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
                color: CustomColors.primary,
                value: (currentQuestionIndex + 1) / questions.length),

            const SizedBox(height: 20),

            // Question Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(questions[currentQuestionIndex]['question'],
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sc')),
                  ),
                  IconButton(
                    icon: Icon(
                        markedForReview[currentQuestionIndex] ?? false
                            ? Icons.flag
                            : Icons.flag_outlined,
                        color: Colors.purple),
                    onPressed: _markForReview,
                  ),
                ],
              ),
            ),
// Question Number Navigation at the Top
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              height: h * 0.10,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(questions.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentQuestionIndex = index;
                        });
                      },
                      child: Container(
                        width: w * 0.10,
                        height: h * 0.10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          // border: Border.all(
                          //   color: Colors.green,
                          //   width: 1,
                          // ),
                          color: _getcontainerColor(index), // Dynamic color
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Options List
            // Options List with Custom Bordered Container
            Column(
              children: List.generate(4, (optionIndex) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnswers[currentQuestionIndex] = optionIndex;
                      questionStatus[currentQuestionIndex] = "Attempted";
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          selectedAnswers[currentQuestionIndex] == optionIndex
                              ? CustomColors.primary.withOpacity(0.2)
                              : Colors.white,
                      border: Border.all(color: CustomColors.primary, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: optionIndex,
                          groupValue: selectedAnswers[currentQuestionIndex],
                          activeColor: CustomColors.primary,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = value;
                              questionStatus[currentQuestionIndex] =
                                  "Attempted";
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            questions[currentQuestionIndex]['options']
                                [optionIndex],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            const Spacer(),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousQuestion,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Previous",
                    style: TextStyle(fontFamily: 'sc', color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedAnswers[currentQuestionIndex] = null;
                      questionStatus[currentQuestionIndex] = "Unattempted";
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    "Clear",
                    style: TextStyle(fontFamily: 'sc', color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: currentQuestionIndex == questions.length - 1
                      ? _submitTest // Call submit function when on last question
                      : _nextQuestion, // Otherwise, go to the next question
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          currentQuestionIndex == questions.length - 1
                              ? Colors.red
                              : Colors.green),
                  child: Text(
                    currentQuestionIndex == questions.length - 1
                        ? "Submit"
                        : "Next",
                    style:
                        const TextStyle(fontFamily: 'sc', color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns content properly
        children: [
          const Padding(
            padding: EdgeInsets.only(
                top: 30,
                bottom: 16,
                left: 16,
                right: 16), // ⬆️ Added top padding
            child: Text(
              "All Questions",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'sc'),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategory("Unattempted", Colors.grey),
                    _buildCategory("Attempted", Colors.blue),
                  ],
                ),
                SizedBox(height: 10), // Spacing between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategory("Mark for Review", Colors.pink),
                    _buildCategory("Not Visited", Colors.grey[300]!),
                  ],
                ),
                SizedBox(height: 10),
                _buildCategory("Answered & Marked for Review", Colors.purple),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisExtent: h * 0.06, // Controls height of grid items
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentQuestionIndex = index;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: w * 0.12, // Set width
                    decoration: BoxDecoration(
                      color: _getcontainerColor(index), // Background color
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'sc',
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // 🔹 Added vertical padding
      child: Row(
        children: [
          Container(
            width: 20, // Increased size
            height: 20, // Increased size
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12), // Increased space
          Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'sc'), // ⬆️ Increased font size
          ),
        ],
      ),
    );
  }

  Color _getcontainerColor(int index) {
    switch (questionStatus[index]) {
      case "Attempted":
        return CustomColors.primary;
      case "Mark for Review":
        return Colors.pink;
      case "Not Visited":
        return Colors.grey[300]!;
      case "Answered & Marked for Review":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

Widget _buildCategory(String title, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontSize: 10, fontFamily: 'sc')),
      ],
    ),
  );
}
