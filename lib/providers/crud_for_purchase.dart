import 'package:fargard_pharmacy_management_system/models/purchase_supplier.dart';
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/purchases.dart';

  class PurchasesProvider extends ChangeNotifier {
    final DatabaseHelper _dbHelper = DatabaseHelper();
    final DatabaseService _databaseService = DatabaseService();

    List<PurchaseWithSupplier> _purchases = [];

    int _lastInsertedPurchaseId = -1;

    List<PurchaseWithSupplier> get purchases => _purchases;

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

    void searchPurchase(String query) async{
      if (query.isEmpty) {
        fetchPurchases();
      } else {
        _purchases = await _databaseService.fetchSearchPurchaseWithSupplier(query);
        notifyListeners();
      }
    }
  }

