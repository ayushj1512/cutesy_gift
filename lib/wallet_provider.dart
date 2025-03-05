import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  double _balance = 25.00; // Initial balance

  double get balance => _balance;

  void addReward(double amount) {
    _balance += amount;
    notifyListeners(); // Notify UI to rebuild
  }
}
