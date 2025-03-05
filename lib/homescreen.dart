import 'dart:ui';

import 'package:cutesy_gifts/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'readnews.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<WalletProvider>(context); // Get wallet balance
    int currentIndex = 3;

    double _calculateScale(int index) {
      int difference = (currentIndex - index).abs();
      switch (difference) {
        case 0:
          return 0.8; // Center tile is the biggest
        case 1:
          return 0.7; // Adjacent tiles
        case 2:
          return 0.6; // Tiles next to adjacent ones
        default:
          return 0.5; // Outermost tiles
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Make Profile Image Clickable to Navigate to 3rd Index
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 2; // Update to 3rd index
                      });
                    },
                    child: Image.asset(
                      "assets/homeprofile.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "John Doe",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  SizedBox(width: 60),
                  Image.asset("assets/star.png", height: 30, width: 30),
                  SizedBox(width: 1),
                  Text(
                    "Level 01",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                  SizedBox(width: 22),
                  Image.asset("assets/wallet.png", height: 30, width: 30),
                  SizedBox(width: 5),
                  Text(
                    "\$${wallet.balance}", // Updated wallet balance dynamically
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Claim Your Daily Reward",
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Color.fromRGBO(150, 82, 0, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: SizedBox(
                  height: 80, // Increased height to fit all tiles
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(7, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index; // Update selected tile
                          });
                        },
                        child: Transform.scale(
                          scale: _calculateScale(index),
                          child: adTile(isCenter: index == currentIndex),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            SizedBox(height: 0),
            Text(
              "Do Tasks, Earn Reward",
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Color.fromRGBO(150, 82, 0, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 7),
            Text(
              "You can do these tasks as many times\nas you want to",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Color.fromRGBO(13, 13, 13, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 37),
            gameCard(
              "assets/406dd7edf8c7ecdb24db65fccbfd938c.png",
              "Play Game",
              "\$10",
            ),
            SizedBox(height: 37),

            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Readnews()),
                );

                // If reward is claimed, update the wallet balance
                if (result == true) {
                  wallet.addReward(5); // Add $5 reward
                }
              },
              child: gameCard(
                "assets/53f2600dfd21dd167ef32a781168bfe0.png",
                "Read News",
                "\$5",
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget gameCard(String imagePath, String title, String price) {
    return Container(
      width: 358,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              height: 200,
              width: 358,
              fit: BoxFit.cover,
            ),
          ),

          // Blur Effect Container at Bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Blur effect
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white.withOpacity(
                    0.3,
                  ), // Semi-transparent effect
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget adTile({bool isCenter = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      width: isCenter ? 70 : 60, // Width changes based on position
      height: isCenter ? 70 : 60, // Height changes based on position
      decoration: BoxDecoration(
        color: isCenter ? Colors.white : Color.fromRGBO(247, 147, 26, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCenter ? Color.fromRGBO(247, 147, 26, 1) : Colors.white,
          width: isCenter ? 3 : 1,
        ),
      ),
      child: Center(
        child: Text(
          "\$2\nAD",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isCenter ? Color.fromRGBO(247, 147, 26, 1) : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: isCenter ? 22 : 14, // Adjust font size based on position
          ),
        ),
      ),
    );
  }
}
