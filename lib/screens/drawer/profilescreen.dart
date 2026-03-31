import 'dart:io'; // For File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package
import 'package:practisecorner/utills/custom_button.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:practisecorner/utills/custom_text.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  late double h, w;
  File? _image; // Variable to hold the selected image

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.Second,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'sc'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.12,
                  width: w,
                  decoration: const BoxDecoration(
                    color: CustomColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70.0),
                      bottomRight: Radius.circular(70.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.001),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: h * 0.17,
                          width: w * 0.37,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 1),
                            image: _image == null
                                ? const DecorationImage(
                                    image:
                                        AssetImage('assets/icons/profile.png'),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.30, top: h * 0.12),
                          child: Container(
                            height: h * 0.05,
                            width: h * 0.05,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: CustomColors.primary, width: 1),
                            ),
                            child: IconButton(
                              onPressed:
                                  _pickImage, // Open gallery when clicked
                              icon: const Icon(
                                Icons.edit,
                                color: CustomColors.primary,
                              ),
                              padding: EdgeInsets.zero,
                              iconSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.03),
                  child: customTextFieldFrofile(
                    hintText: 'Full Name',
                    maxLength: 10,
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: CustomColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.001, horizontal: w * 0.03),
                  child: customTextFieldFrofile(
                    hintText: 'Email ID',
                    maxLength: 30,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: CustomColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.03),
                  child: customTextFieldFrofile(
                    hintText: 'Phone Number',
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: CustomColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.002, horizontal: w * 0.03),
                  child: customTextFieldFrofile(
                    hintText: 'State',
                    maxLength: 20,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: CustomColors.primary,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: CustomColors.primary,
                      ),
                      onPressed: () {
                        // Add your logic to display state list here
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.03),
                  child: customTextFieldFrofile(
                    hintText: 'District',
                    maxLength: 20,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.map,
                      color: CustomColors.primary,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: CustomColors.primary,
                      ),
                      onPressed: () {
                        // Add your logic to display district list here
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.002, horizontal: w * 0.03),
                  child: customTextFieldFrofile(
                    hintText: 'Password',
                    maxLength: 10,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: CustomColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.03, horizontal: w * 0.03),
                  child: custonButton(
                    context,
                    onTap: () {
                      // Add your button functionality here
                    },
                    data: 'SUBMIT',
                    isloader: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
