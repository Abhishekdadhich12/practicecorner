// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:practisecorner/bookshala/BookshalaCategorie.dart';
import 'package:practisecorner/bookshala/BookshalaHome.dart';
import 'package:practisecorner/bookshala/BookshalaMyBag.dart';
import 'package:practisecorner/bookshala/BookshalaMyOrders.dart';
import 'package:practisecorner/bookshala/BookshalaProfile.dart';

class BookBottomBar extends StatefulWidget {
  BookBottomBar({super.key, required this.currentIndex});
  int currentIndex;

  @override
  State<BookBottomBar> createState() => _BookBottomBarState();
}

class _BookBottomBarState extends State<BookBottomBar> {
  List<Widget> pages = [
    const BookshalaHome(),
    const BookshalaCategories(),
    const BookshalaMyBag(),
    const BookshalaMyorders(),
    const BookshalaProfile(),
  ];
  late double h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: pages[widget.currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentIndex,
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
            });
          },
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, size: 28),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category, size: 28),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag, size: 28),
              label: "Bag",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long, size: 28),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person, size: 28),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
