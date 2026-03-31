import 'package:flutter/material.dart';
import 'package:practisecorner/onboarding/selectexamcategory.dart';
import 'package:practisecorner/screens/bottombar/bottom_bar.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  late double h, w;
  bool isChecked = false; // Checkbox state
  List<TextEditingController> otpControllers = List.generate(6,
      (_) => TextEditingController()); // Separate controllers for each OTP box
  bool isTimerActive = false; // Timer state
  int secondsLeft = 60; // Countdown time (1 minute)

  // Countdown Timer logic
  void startTimer() {
    setState(() {
      isTimerActive = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (secondsLeft > 0 && isTimerActive) {
        setState(() {
          secondsLeft--;
        });
        startTimer(); // Recursively call to update every second
      } else {
        setState(() {
          isTimerActive = false;
        });
      }
    });
  }

  // Checkbox change handler
  void onChanged(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer automatically when the OTP screen is shown
  }

  // Method to generate the OTP input boxes
  Widget otpInputField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 40,
          height: 50,
          child: TextFormField(
            controller:
                otpControllers[index], // Use individual controller for each box
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: CustomColors.primary),
              ),
              counterText: '',
            ),
            maxLength: 1,
            onChanged: (value) {
              if (value.length == 1 && index < 5) {
                FocusScope.of(context).nextFocus(); // Move focus to next box
              }
              // Trigger navigation when all 6 digits are entered
              if (otpControllers
                  .every((controller) => controller.text.isNotEmpty)) {
                // Go to next screen (e.g., Home screen)
                Navigator.pushNamed(
                    context, '/nextScreen'); // Change to the actual screen name
              }
            },
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Container
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
                padding: EdgeInsets.only(top: h * 0.10, left: w * 0.08),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      iconSize: 33,
                      onPressed: () {
                        Navigator.pop(
                            context); // Navigate to the previous screen
                      },
                    ),
                    const Text(
                      'Verification Code',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'sc',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset('assets/icons/number3.png'),

            SizedBox(height: h * 0.02),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Enter 6 Digit Verification Code Sent To Your Number',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'sc',
                    color: CustomColors.primary),
              ),
            ),
            SizedBox(height: h * 0.04),
            // OTP Input Fields (6 boxes)
            otpInputField(),

            SizedBox(height: h * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.timer,
                  color: CustomColors.primary,
                ),
                Text(
                  isTimerActive ? '$secondsLeft s' : 'OTP expired',
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'sc',
                      color: CustomColors.primary),
                ),
              ],
            ),

            SizedBox(height: h * 0.02),

            // Send OTP Button with GestureDetector
            GestureDetector(
              onTap: isChecked
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Selectexamcategory()));
                    }
                  : null,
              child: Container(
                height: h * 0.06,
                width: w * 0.80,
                decoration: BoxDecoration(
                  color: isChecked
                      ? CustomColors.primary // Valid input
                      : const Color(0xFF92D9D2), // Invalid input
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Text(
                  'Verify & Continue',
                  style: TextStyle(
                      fontFamily: 'sc', fontSize: 24, color: Colors.white),
                ),
                alignment: Alignment.center,
              ),
            ),

            // Terms of Use and Privacy Policy with Checkbox
            Padding(
              padding: EdgeInsets.only(left: w * 0.07),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: onChanged,
                    activeColor: CustomColors.primary,
                  ),
                  const Text(
                    'I Have Read ',
                    style: TextStyle(fontFamily: 'sc', fontSize: 10),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'the Terms Of Use ',
                      style: TextStyle(
                          fontSize: 10,
                          color: CustomColors.primary,
                          fontFamily: 'sc'), // Regular text color
                      children: <TextSpan>[
                        TextSpan(
                          text: 'and Privacy Policy',
                          style: TextStyle(
                              fontSize: 10,
                              color: CustomColors.primary,
                              fontFamily: 'sc'), // Custom color
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
