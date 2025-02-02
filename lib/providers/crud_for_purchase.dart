  import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/purchases.dart';

  class PurchasesProvider extends ChangeNotifier {
    final DatabaseHelper _dbHelper = DatabaseHelper();
    final DatabaseService _databaseService = DatabaseService();

    List<Purchase> _purchases = [];
    int _lastInsertedPurchaseId = -1;

    List<Purchase> get purchases => _purchases;
    int get lastInsertedPurchaseId => _lastInsertedPurchaseId;

    Future<void> fetchPurchases() async {
      _purchases = await _databaseService.fetchPurchase();
      notifyListeners();
    }

    Future<void> addPurchase(Purchase purchase) async {
      await _dbHelper.addPurchases(purchase);
      await fetchPurchases();
    }

    Future<void> updatePurchases(Purchase purchase) async {
      await _dbHelper.updatePurchases(purchase);
      await fetchPurchases();
    }

    Future<void> deletePurchases(int id) async {
      await _dbHelper.deletePurchases(id);
      await fetchPurchases();
    }
    Future<void> fetchLastInsertedPurchaseId() async {
      _lastInsertedPurchaseId = await _dbHelper.fetchLastInsertedPurchaseId();
      notifyListeners();
    }
  }

