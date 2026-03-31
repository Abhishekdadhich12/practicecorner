import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late double h, w;
  final List<String> suggestions = [
    "Rajasthan Exam",
    "GK",
    "Current Affairs",
    "Nursing",
    "NEET/JEE",
    "Government Exams",
    "Engineering",
    "CUET",
    "Agriculture",
  ];
  late int currentIndex = 0; // Initialize currentIndex to avoid errors
  late Timer _timer;
  bool isEditing = false; // Flag to determine if the user is typing
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Timer to cycle through suggestions
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!isEditing) {
        // Update the hint text only if the user is not typing
        setState(() {
          currentIndex = (currentIndex + 1) % suggestions.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: h * 0.18,
                width: w,
                decoration: const BoxDecoration(
                  color: CustomColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h * 0.09,
                  left: w * 0.05,
                  right: w * 0.05,
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set white background
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          height: h * 0.03,
                          width: w * 0.002,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _controller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: !isEditing
                                  ? suggestions[currentIndex]
                                  : null, // Show cycling suggestions only when not typing
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                isEditing = true; // User starts typing
                              });
                            },
                            onChanged: (value) {
                              if (value.isEmpty) {
                                setState(() {
                                  isEditing =
                                      false; // Reset if the field is empty
                                });
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black),
                          onPressed: () {
                            _controller.clear();
                            setState(() {
                              isEditing = false; // Allow cycling again
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.13),
            child: Image.asset('assets/icons/search.png'),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          const Text(
            'Search Practice Corner',
            style: TextStyle(fontFamily: 'sc', fontSize: 15),
          ),
          SizedBox(
            height: h * 0.002,
          ),
          const Text(
            'Find Live Course, Recorded Course of any Topic',
            style:
                TextStyle(fontFamily: 'sc', fontSize: 15, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
