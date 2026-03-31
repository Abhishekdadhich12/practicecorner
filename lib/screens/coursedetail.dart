import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:practisecorner/screens/wishlistscreens/buynow.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Coursedetail extends StatefulWidget {
  const Coursedetail({super.key});

  @override
  State<Coursedetail> createState() => _CoursedetailState();
}

class _CoursedetailState extends State<Coursedetail> {
  late double h, w;

  late List<bool> isExpandedList; // Declare the list
  @override
  void initState() {
    super.initState();
    isExpandedList = List.filled(5, false); // Initialize with 5 false values
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primary,
          iconTheme: const IconThemeData(color: Colors.white),
          title: SizedBox(
            height: 30, // Ensures text visibility
            child: Marquee(
              text: 'GS & GS BRAHMASTRA 3.0 BATCH',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'sc',
                fontSize: 18,
              ),
              scrollAxis: Axis.horizontal,
              blankSpace: 50.0,
              velocity: 30.0,
              pauseAfterRound: Duration(seconds: 1),
              startPadding: 10.0,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: h * 0.08),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/icons/pc1.jpeg',
                      height: h * 0.20,
                      width: w * 0.40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: h * 0.03),
                  const Text(
                    'GK & GS Brahmastra 3.0 Batch',
                    style: TextStyle(fontFamily: 'sc', fontSize: 16),
                  ),
                  SizedBox(height: h * 0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Code: 18999',
                        style: TextStyle(fontFamily: 'sc', fontSize: 16),
                      ),
                      Text(
                        'Validity : 365 Days',
                        style: TextStyle(fontFamily: 'sc', fontSize: 16),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Text(
                    'Course Offerings',
                    style: TextStyle(
                        fontFamily: 'sc',
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: h * 0.02),
                  Container(
                    height: h * 0.15,
                    width: w * 0.98,
                    decoration: BoxDecoration(
                      color: CustomColors.Second,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < 3; i++) // To avoid repetition
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/icons/Group (1).png'),
                                SizedBox(width: w * 0.02),
                                const Text(
                                  'Live and Recorded Lectures',
                                  style:
                                      TextStyle(fontFamily: 'sc', fontSize: 12),
                                ),
                                SizedBox(width: w * 0.06),
                                Image.asset('assets/icons/Group (1).png'),
                                SizedBox(width: w * 0.02),
                                const Text(
                                  'DPP & Class PDFs',
                                  style:
                                      TextStyle(fontFamily: 'sc', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.03),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return DraggableScrollableSheet(
                            expand: false,
                            maxChildSize: 0.9,
                            minChildSize: 0.4,
                            builder: (context, scrollController) {
                              return Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  color: Colors.white,
                                ),
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Course Description',
                                            style: TextStyle(
                                              fontFamily: 'sc',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child: const Icon(
                                              Icons.close,
                                              color: CustomColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'प्रैक्टिस कॉर्नर के साथ सरकारी परीक्षा की तैयारी के लिए सीमित समय की सेल शुरू हो गई है। हमारे विशेष ऑनलाइन कोर्स के साथ सीखने की दुनिया को अनलॉक करें! प्रैक्टिस कॉर्नर की ऑनलाइन कोर्स बैच पर नए साल की सेल सीधे आपकी उंगलियों पर विशेषज्ञ मार्गदर्शन लाती है',
                                        style: TextStyle(
                                            fontFamily: 'sc',
                                            fontSize: 14,
                                            color: Colors.orange),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'प्रैक्टिस कॉर्नर  :- New Year महाबचत ऑफ़र में आज और कल यानी 31 दिसम्बर, 2023 व 1 जनवरी, 2024 को यह कोर्स बेहद नाममात्र के शुल्क में आपके लिए उपलब्ध करवाया गया है। इसके अलावा ब्रह्मास्त्र 2.0 बैच के साथ आपको मिलने वाला है Tiranga (तिरंगा) Batch बिल्कुल FREE',
                                        style: TextStyle(
                                            fontFamily: 'sc',
                                            fontSize: 14,
                                            color: Colors.red),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Batch Details : -',
                                        style: TextStyle(
                                            fontFamily: 'sc',
                                            fontSize: 14,
                                            color: Colors.red),
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.navigate_next),
                                          Text(
                                            'Live/Recorded Classes',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.navigate_next),
                                          Text(
                                            'Daily Classes : 1.30 Hours',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.navigate_next),
                                          Text(
                                            'Course Duration - 8 Months',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.navigate_next),
                                          Text(
                                            'Previous Year Papers',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.navigate_next),
                                          Text(
                                            'Every Sunday Test',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.navigate_next),
                                          Text(
                                            'Access For 12 Months',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.navigate_next),
                                          Text(
                                            'Medium - Hindi (विशेषज्ञ कुमार गौरव सर )',
                                            style: TextStyle(
                                                fontFamily: 'sc',
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      const Text(
                                        'राजस्थान परीक्षाएं ',
                                        style: TextStyle(
                                            fontFamily: 'sc',
                                            fontSize: 22,
                                            color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      const Text(
                                        'इस वर्ष राजस्थान सरकार द्वारा बम्पर रिक्तियों की घोषणा की गई है, जो उन छात्रों के लिए एक सुनहरा अवसर है जो 2025 में नवीनतम सरकारी परीक्षाओं की तैयारी कर रहे हैं। इस वर्ष हम आरपीएससी आरएएस, पटवार, जेल प्रहरी, वीडीओ, सीईटी, कंप्यूटर प्रशिक्षक, लाइब्रेरियन, लैब सहायक आदि जैसे बैचों के लिए सभी बैचों पर 90% की छूट की घोषणा भी कर रहे हैं। आप परीक्षा की तैयारी के लिए इन सर्वश्रेष्ठ नए साल के प्रस्तावों का लाभ उठाकर हमारे बैचों में दाखिला ले सकते हैं, ',
                                        style: TextStyle(
                                            fontFamily: 'sc', fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      const Text(
                                        'सिविल सेवा परीक्षा ',
                                        style: TextStyle(
                                            fontFamily: 'sc',
                                            fontSize: 22,
                                            color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      const Text(
                                        'इस वर्ष राजस्थान सरकार द्वारा बम्पर रिक्तियों की घोषणा की गई है, जो उन छात्रों के लिए एक सुनहरा अवसर है जो 2025 में नवीनतम सरकारी परीक्षाओं की तैयारी कर रहे हैं। इस वर्ष हम आरपीएससी आरएएस, पटवार, जेल प्रहरी, वीडीओ, सीईटी, कंप्यूटर प्रशिक्षक, लाइब्रेरियन, लैब सहायक आदि जैसे बैचों के लिए सभी बैचों पर 90% की छूट की घोषणा भी कर रहे हैं। आप परीक्षा की तैयारी के लिए इन सर्वश्रेष्ठ नए साल के प्रस्तावों का लाभ उठाकर हमारे बैचों में दाखिला ले सकते हैं, ',
                                        style: TextStyle(
                                            fontFamily: 'sc', fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      const Text(
                                        'निःशुल्क टेस्ट सीरीज एवं अध्ययन सामग्री  ',
                                        style: TextStyle(
                                            fontFamily: 'sc',
                                            fontSize: 22,
                                            color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      const Text(
                                        'अपने भरोसे और छात्रों को सर्वश्रेष्ठ प्रदान करने के लिए जाना जाता है। इसलिए इस नए साल में उत्कर्ष आपको सरकारी परीक्षा की तैयारी के लिए टेस्ट सीरीज तक मुफ्त पहुंच प्रदान कर रहा है। हमारी निःशुल्क टेस्ट सीरीज के विवरण को देखने के लिए नीचे दी गई तालिका पर एक नज़र डालें:  ',
                                        style: TextStyle(
                                            fontFamily: 'sc', fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.98,
                      decoration: BoxDecoration(
                        color: CustomColors.Second,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Course Description',
                              style: TextStyle(
                                fontFamily: 'sc',
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.05,
                          width: w * 0.98,
                          decoration: BoxDecoration(
                              color: CustomColors.Second,
                              borderRadius: BorderRadius.circular(9)),
                          child: TabBar(
                            unselectedLabelColor: Colors.black,
                            labelColor: CustomColors.primary,
                            // Color for unselected tab text
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                color: Colors.black, // Color of the underline
                                width: 2.0, // Thickness of the underline
                              ),
                              insets: EdgeInsets.zero,
                            ),
                            tabs: [
                              Tab(
                                child: Text(
                                  'COMBO',
                                  style:
                                      TextStyle(fontFamily: 'sc', fontSize: 14),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'FAQ',
                                  style:
                                      TextStyle(fontFamily: 'sc', fontSize: 16),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'FACULTY',
                                  style:
                                      TextStyle(fontFamily: 'sc', fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        SizedBox(
                            height: h *
                                0.4, // Adjust this height according to your content
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  // Wrap the content in SingleChildScrollView
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h * 0.12,
                                        width: w * 0.99,
                                        decoration: BoxDecoration(
                                            color: CustomColors.Second,
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/icons/pc1.jpeg',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'GK & GS Brahmastra 3.0 Batch',
                                                  style: TextStyle(
                                                      fontFamily: 'sc',
                                                      fontSize: 16),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      Container(
                                        height: h * 0.12,
                                        width: w * 0.99,
                                        decoration: BoxDecoration(
                                            color: CustomColors.Second,
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/icons/pc2.jpeg',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'GK & GS Brahmastra 3.0 Batch',
                                                  style: TextStyle(
                                                      fontFamily: 'sc',
                                                      fontSize: 16),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      Container(
                                        height: h * 0.12,
                                        width: w * 0.99,
                                        decoration: BoxDecoration(
                                            color: CustomColors.Second,
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/icons/pc3.jpeg',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'GK & GS Brahmastra 3.0 Batch',
                                                  style: TextStyle(
                                                      fontFamily: 'sc',
                                                      fontSize: 16),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.12,
                                      )
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Frequently Asked Questions',
                                        style: const TextStyle(
                                            fontFamily: 'sc', fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      // Generate the containers dynamically
                                      ...List.generate(5, (index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isExpandedList[index] =
                                                      !isExpandedList[
                                                          index]; // Toggle specific container
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds:
                                                        300), // Smooth animation
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'इस ऑनलाइन कोर्स में क्या-क्या शामिल होगा? ',
                                                            style:
                                                                const TextStyle(
                                                                    fontFamily:
                                                                        'sc',
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ),
                                                        Icon(
                                                          isExpandedList[index]
                                                              ? Icons
                                                                  .arrow_upward
                                                              : Icons
                                                                  .arrow_downward,
                                                        ),
                                                      ],
                                                    ),
                                                    if (isExpandedList[index])
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 8.0),
                                                        child: Text(
                                                          'यह कोर्स विभिन्न महत्वपूर्ण विषयों को कवर करेगा, जो आपको सफलता पाने में मदद करेगा। यहां पर विस्तार से बताया जाएगा कि कोर्स में क्या-क्या सामग्री शामिल है।',
                                                          style: TextStyle(
                                                              fontFamily: 'sc',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.02,
                                            ),
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: h * 0.16,
                                      width: w * 0.99,
                                      decoration: BoxDecoration(
                                          color: CustomColors.Second,
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/icons/pc6.jpeg',
                                            ),
                                            SizedBox(
                                              width: w * 0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ravi Sharma',
                                                  style: TextStyle(
                                                      fontFamily: 'sc',
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  'Static GK & GS',
                                                  style: TextStyle(
                                                      fontFamily: 'sc',
                                                      fontSize: 15),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.zero, // Remove padding around the buttons
          child: SizedBox(
            width: MediaQuery.of(context).size.width, // Full screen width
            child: Container(
              height: h * 0.10,
              width: w,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Price : ₹ 5000',
                      style: TextStyle(fontFamily: 'sc', fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          '₹ 1000',
                          style: TextStyle(
                              fontFamily: 'sc',
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(GST Included)',
                          style: TextStyle(fontFamily: 'sc', fontSize: 12),
                        ),
                        SizedBox(
                          width: w * 0.20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Buynow()));
                          },
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.31,
                            decoration: BoxDecoration(
                                color: CustomColors.primary,
                                borderRadius: BorderRadius.circular(9)),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  fontFamily: 'sc',
                                  fontSize: 23,
                                  color: Colors.white),
                            ),
                            alignment: Alignment.center,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
