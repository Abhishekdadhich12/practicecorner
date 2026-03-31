import 'package:flutter/material.dart';
import 'package:practisecorner/screens/drawer/askai.dart';
import 'package:practisecorner/screens/drawer/profilescreen.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  late double h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
        color: Colors.white.withOpacity(0.8), // Light background with opacity
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: h * 0.06, left: w * 0.03),
            child: Column(
              children: [
                Row(
                  children: [
                    // Profile Picture
                    ClipOval(
                      child: Image.asset(
                        'assets/icons/download.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: w * 0.03), // Space between image and text
                    // Name and Phone Number
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abhishek Dadhich',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sc',
                              color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '+1 123 456 7890',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'sc'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profilescreen()));
                      },
                      icon: Image.asset('assets/icons/Group.png'),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.04),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.school, color: Colors.blue),
                  title: const Text(
                    'Ask Ai',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AskAiScreen()),
                    );
                  },
                ),
                const ListTile(
                  leading: Icon(Icons.school, color: Colors.black),
                  title: Text(
                    'Offline Batch',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.bookmark, color: Colors.black),
                  title: Text(
                    'Saved Items',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.download, color: Colors.black),
                  title: Text(
                    'Downloads',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.card_giftcard, color: Colors.black),
                  title: Text(
                    'Refer & Earn',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.black),
                  title: Text(
                    'Digital OMR',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.transfer_within_a_station,
                      color: Colors.black),
                  title: Text(
                    'Course Transfer',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.swap_horiz, color: Colors.black),
                  title: Text(
                    'Usage Transfer',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.confirmation_number, color: Colors.black),
                  title: Text(
                    'Coupon',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.black),
                  title: Text(
                    'My Purchase',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.qr_code, color: Colors.black),
                  title: Text(
                    'Scan QR Code',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.help, color: Colors.black),
                  title: Text(
                    'Helpdesk',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.video_library, color: Colors.black),
                  title: Text(
                    'App Tutorial',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.nights_stay, color: Colors.black),
                  title: Text(
                    'Dark Mode',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.question_answer, color: Colors.black),
                  title: Text(
                    'FAQ',
                    style: TextStyle(
                        fontFamily: 'sc', fontSize: 15, color: Colors.black),
                  ),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.logout, color: Colors.black),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'sc',
                      color: Colors.black,
                    ),
                  ),
                  onTap: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
