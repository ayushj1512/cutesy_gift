import 'dart:async';
import 'package:cutesy_gifts/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class Readnews extends StatefulWidget {
  const Readnews({super.key});

  @override
  State<Readnews> createState() => _ReadnewsState();
}

class _ReadnewsState extends State<Readnews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 20,
        backgroundColor: Color.fromRGBO(247, 147, 26, 1),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/back.png", height: 40, width: 40),
              ),
              SizedBox(width: 70),
              Text(
                "Read News",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color.fromRGBO(247, 147, 26, 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 76),
          Image.asset(
            "assets/53f2600dfd21dd167ef32a781168bfe0.png",
            width: 358,
            height: 185,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 59),
          Padding(
            padding: const EdgeInsets.fromLTRB(41, 0, 0, 0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Rules of Task",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 37),
          Padding(
            padding: const EdgeInsets.fromLTRB(41, 0, 0, 0),
            child: Text(
              "Keep scrolling for 10 minutes.\n\nKeep clicking every 30 seconds.\n\nDon't leave still screen for more than 30 seconds.",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 42),
          Padding(
            padding: const EdgeInsets.fromLTRB(41, 0, 0, 0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 48,
                width: 192.36,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WebViewScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(247, 147, 26, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Start Task",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Ensure this file exists

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  late Timer _timer;
  bool _rewardEarned = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) {
                setState(() {
                  _isLoading = false;
                });
              },
            ),
          )
          ..loadRequest(Uri.parse("https://www.bbc.com/news")); // Load news URL

    // Start reward timer
    _timer = Timer(Duration(seconds: 15), () {
      setState(() {
        _rewardEarned = true;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _claimReward() {
    // Update wallet balance using Provider
    Provider.of<WalletProvider>(context, listen: false).addReward(5.00);

    // Navigate back twice to home screen
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 20,
        backgroundColor: Color.fromRGBO(247, 147, 26, 1),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),

          if (_isLoading) Center(child: CircularProgressIndicator()),

          if (_rewardEarned)
            Center(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                title: Text(
                  "🎉 Congratulations!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(247, 147, 26, 1), // Theme color
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: 50,
                      color: Color.fromRGBO(247, 147, 26, 1),
                    ), // Trophy Icon
                    SizedBox(height: 10),
                    Text(
                      "You have earned your reward!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                    onPressed: _claimReward,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(
                        247,
                        147,
                        26,
                        1,
                      ), // Theme button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      "Claim Reward",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
