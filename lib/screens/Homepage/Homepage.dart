import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practisecorner/screens/drawer/drawer.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? selectedOption = 'Practice Corner';
  String selectedTab = 'Free';
  String selectedoptionallshowGkandgsExam = 'Gk & GS';
  String selectedOptionallindiaexam = 'All India Exam';
  final GlobalKey _menuKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isSearching = false;
  late double h, w;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const Mydrawer(),
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            if (!isSearching)
              Text(
                selectedOption ?? 'Practice Corner',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'sc',
                  color: CustomColors.primarytext,
                ),
              ),
            if (isSearching)
              SizedBox(
                width: 250,
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
            if (!isSearching)
              GestureDetector(
                key: _menuKey,
                onTap: () {
                  final RenderBox renderBox =
                      _menuKey.currentContext!.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final appBarHeight = AppBar().preferredSize.height;

                  showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      position.dx,
                      position.dy + renderBox.size.height + 5,
                      position.dx + renderBox.size.width,
                      appBarHeight + 100,
                    ),
                    items: <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                          value: 'Government Exam',
                          child: Text('GOVERNMENT EXAM',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                      const PopupMenuItem<String>(
                          value: 'Nursing',
                          child: Text('NURSING',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                      const PopupMenuItem<String>(
                          value: 'NEET/JEE',
                          child: Text('NEET/JEE',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                      const PopupMenuItem<String>(
                          value: 'Defence',
                          child: Text('DEFENCE',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                      const PopupMenuItem<String>(
                          value: 'Clat',
                          child: Text('CLAT/Law Exam',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                      const PopupMenuItem<String>(
                          value: 'Engg',
                          child: Text('ENGINEERING',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                      const PopupMenuItem<String>(
                          value: 'CUET',
                          child: Text('CUET',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                      const PopupMenuItem<String>(
                          value: 'Agriculture',
                          child: Text('AGRICULTURE',
                              style: TextStyle(
                                fontFamily: 'sc',
                              ))),
                    ],
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        selectedOption = value;
                      });
                    }
                  });
                },
                child: const Icon(Icons.arrow_drop_down, color: Colors.white),
              ),
            const Spacer(),
            IconButton(
              icon: Icon(isSearching ? Icons.close : Icons.search,
                  color: Colors.white),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (isSearching) {
                    _focusNode.requestFocus();
                  } else {
                    _focusNode.unfocus();
                    _searchController.clear();
                  }
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.35,
                  width: w,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    color: CustomColors.Second,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Container(
                    height: h * 0.18,
                    width: w,
                    decoration: const BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureCard(
                          "assets/icons/mylibrary.svg", "My", "Library"),
                      _buildFeatureCard(
                          "assets/icons/liveclass.svg", "Live", "Classes"),
                      _buildFeatureCard(
                          "assets/icons/checkbook.svg", "Live", "Tests"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showAllIndiaExamDropdown(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                selectedOptionallindiaexam,
                                style: const TextStyle(
                                  fontFamily: 'sc',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: GestureDetector(
                          onTap: () {
                            _showGkandgsExamDropdown(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  'GK & GS',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'sc',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: h * 0.05,
                        width: w * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/filter.svg',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            _openFullWidthBottomSheet(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6, // Number of items in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 20, // Horizontal space between items
                    mainAxisSpacing: 20, // Vertical space between items
                    childAspectRatio: 0.53),
                itemBuilder: (context, index) {
                  List<String> imagePaths = [
                    'assets/icons/download.png', // First image
                    'assets/icons/download.png', // Second image
                    'assets/icons/download.png', // Third image
                    'assets/icons/download.png', // Fourth image
                    'assets/icons/download.png', // Fifth image
                    'assets/icons/download.png', // Sixth image
                  ];
                  return Container(
                    height: 500,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.grey, width: 0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Center horizontally
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                    9), // Match the container's top border radius
                                topRight: Radius.circular(9),
                                bottomLeft: Radius.circular(9),
                                bottomRight: Radius.circular(9)),
                            child: Image.asset(
                              'assets/icons/download.png',
                              height: 200, // Adjust to match the desired height
                              width: double
                                  .infinity, // Make the image fill the width of the container
                              fit: BoxFit
                                  .cover, // Ensure the image covers the available space
                            ),
                          ),
                          const SizedBox(
                              height: 10), // Space between image and text
                          const Text(
                            'Gk & GS Brahmastra 3.0', // Replace with your text
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sc',
                            ),
                            // Center-align the text
                          ),
                          const Text(
                            'Batch', // Replace with your text
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'sc',
                                fontWeight: FontWeight.bold),
                            // Center-align the text
                          ),
                          const Text(
                            'Validity 365 Days', // Replace with your text
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'sc',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // Center-align the text
                          ),
                          const Text(
                            '₹ 399/-', // Display the ₹ symbol with the price
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'sc',
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign:
                                TextAlign.center, // Center-align the text
                          ),
                          const Text(
                            '₹ 2999/-', // Display the ₹ symbol with the price
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sc',

                              color: Colors.grey,
                              decoration: TextDecoration
                                  .lineThrough, // Apply line-through (strikethrough)
                            ),
                            textAlign:
                                TextAlign.center, // Center-align the text
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String assetPath, String title, String subtitle) {
    return Container(
      height: h * 0.20,
      width: w * 0.26,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            height: h * 0.10,
            width: w * 0.20,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: "$title\n",
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'sc',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'sc',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showAllIndiaExamDropdown(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        0,
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'Rajasthan Exams',
          child: Text(
            'Rajasthan Exams',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Uttar Pradesh Exams',
          child: Text(
            'Uttar Pradesh Exams',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'UGC NET JRF',
          child: Text(
            'UGC NET JRF',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Madhya Pradesh Exam',
          child: Text(
            'Madhya Pradesh Exam',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Bihar Exams',
          child: Text(
            'Bihar Exams',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Haryana Exams',
          child: Text(
            'Haryana Exams',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Jharkhand Exams',
          child: Text(
            'Jharkhand Exams',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Punjab Exams',
          child: Text(
            'Punjab Exams',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
      color: Colors.white,
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedOptionallindiaexam = _truncateText(value);
        });
      }
    });
  }

  String _truncateText(String text) {
    if (text.length > 10) {
      return text.substring(0, 9) + '...';
    } else {
      return text;
    }
  }

  void _showGkandgsExamDropdown(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        0,
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'CTET',
          child: Text(
            'CTET',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'PCS',
          child: Text(
            'PCS',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'RO and ARO',
          child: Text(
            'RO and ARO',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Sub Inspector',
          child: Text(
            'Sub Inspector',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Constable',
          child: Text(
            'Constable',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'PET',
          child: Text(
            'PET',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'TET',
          child: Text(
            'TET',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Super TET',
          child: Text(
            'Super TET',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const PopupMenuItem<String>(
          value: 'SSC',
          child: Text(
            'SSC',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedoptionallshowGkandgsExam = _truncateText(value);
        });
      }
    });
  }
}

void _openFullWidthBottomSheet(BuildContext context) {
  String selectedTab = 'Free'; // Initial state for Course Type

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.49,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Advance Filters',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'sc',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  child: Text(
                    'Language',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'sc',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LanguageDropdownFormField(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  child: Text(
                    'Course Type',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'sc',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 'Free';
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: selectedTab == 'Free'
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Free',
                          style: TextStyle(
                            fontFamily: 'sc',
                            fontSize: 16,
                            color: selectedTab == 'Free'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 'Paid';
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: selectedTab == 'Paid'
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Paid',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'sc',
                            color: selectedTab == 'Paid'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 'Both';
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: selectedTab == 'Both'
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Both',
                          style: TextStyle(
                            fontFamily: 'sc',
                            fontSize: 16,
                            color: selectedTab == 'Both'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                        color: CustomColors.primary,
                        borderRadius: BorderRadius.circular(13)),
                    child: const Text(
                      'Apply Filter',
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'sc',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}

class LanguageDropdownFormField extends StatefulWidget {
  const LanguageDropdownFormField({super.key});

  @override
  _LanguageDropdownFormFieldState createState() =>
      _LanguageDropdownFormFieldState();
}

class _LanguageDropdownFormFieldState extends State<LanguageDropdownFormField> {
  String _selectedLanguage = 'Select Language'; // Initial placeholder text

  final List<String> _languages = [
    'Hindi',
    'English',
    'Tamil',
    'Odia',
    'Marathi',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: _openLanguageDropdown,
        child: AbsorbPointer(
          child: TextFormField(
            readOnly: true,
            controller: TextEditingController(text: _selectedLanguage),
            decoration: InputDecoration(
              hintText: 'Select Language',
              suffixIcon: const Icon(Icons.arrow_drop_down),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openLanguageDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: _languages.map((language) {
            return ListTile(
              title: Text(language),
              onTap: () {
                setState(() {
                  _selectedLanguage = language;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
