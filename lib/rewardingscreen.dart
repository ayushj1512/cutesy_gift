import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'wallet_provider.dart';

class RewardingLevelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double walletBalance = Provider.of<WalletProvider>(context).balance;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            RewardCard(
              level: "Level 01",
              minWithdrawal: 50,
              earnings: walletBalance,
              progress: walletBalance / 50,
              // Highlight first level
            ),
            SizedBox(height: 20),
            RewardCard(
              level: "Level 02",
              minWithdrawal: 100,
              earnings: 0,
              progress: 0,
            ),
            SizedBox(height: 20),
            RewardCard(
              level: "Level 03",
              minWithdrawal: 150,
              earnings: 0,
              progress: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final String level;
  final double minWithdrawal;
  final double earnings;
  final double progress;
  final bool isHighlighted;

  const RewardCard({
    required this.level,
    required this.minWithdrawal,
    required this.earnings,
    required this.progress,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 172,
        width: 343,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border:
              isHighlighted
                  ? Border.all(color: Colors.blue, width: 3)
                  : Border.all(
                    width: 1.5,
                    color: Color.fromRGBO(247, 147, 26, 1),
                  ),
        ),
        child: Column(
          children: [
            Container(
              width: 387,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 147, 26, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(
                level,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Minimum Withdrawal = \$${minWithdrawal.toInt()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromRGBO(247, 147, 26, 1),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your earnings = \$${earnings.toInt()}",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 10),

                  // Stack to overlay percentage text on progress bar with border
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white, // White background
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(247, 147, 26, 1),
                            width: 2,
                          ), // Border
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress.clamp(0.0, 1.0),
                          backgroundColor:
                              Colors.transparent, // Keep background transparent
                          color: Color.fromRGBO(247, 147, 26, 1),
                          minHeight: 20,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Text(
                            "${(progress * 100).toInt()}%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white, // Make sure it's readable
                            ),
                          ),
                        ),
                      ),
                    ],
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
