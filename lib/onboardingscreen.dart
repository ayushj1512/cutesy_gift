import 'package:cutesy_gifts/BNB.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/86360b0941d6325adec6f9a52490496a.png",
              height: 120,
              width: 120,
            ),
            SizedBox(height: 20),
            Text(
              "COINBOOST",
              style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Color.fromRGBO(247, 147, 26, 1),
              ),
            ),
            SizedBox(height: 80),
            Image.asset(
              "assets/d71ed9f680398f552e863d4ef2ebc790.png",
              height: 250,
              width: 250,
            ),
            SizedBox(height: 50),
            Container(
              height: 48,
              width: 307,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Shadow color
                    blurRadius: 6, // Soft blur
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center, // Center hint text
                decoration: InputDecoration(
                  border: InputBorder.none, // No border
                  hintText: "Enter Your Mobile Number",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
            Container(
              height: 48,
              width: 307,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Shadow color
                    blurRadius: 6, // Soft blur
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(247, 147, 26, 1),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Bnb()),
                  );
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
