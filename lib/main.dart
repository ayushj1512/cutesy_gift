import 'package:cutesy_gifts/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'wallet_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Ensures Flutter binding is initialized

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WalletProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splashscreen());
  }
}
