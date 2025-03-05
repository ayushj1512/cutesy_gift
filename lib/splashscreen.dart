import 'package:cutesy_gifts/BNB.dart';
import 'package:cutesy_gifts/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder:
              (context, animation, secondaryAnimation) => Onboardingscreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/86360b0941d6325adec6f9a52490496a.png",
              height: 190,
              width: 190,
            ),
            SizedBox(height: 20),
            Text(
              "COINBOOST",
              style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.w700,
                fontSize: 40,
                color: Color.fromRGBO(247, 147, 26, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
