  import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
  import 'package:fargard_pharmacy_management_system/modal_classes/medicines.dart';
  import 'package:fargard_pharmacy_management_system/modal_classes/purchases.dart';
  import 'package:flutter/material.dart';
  import '../database_manager _folder/database_helper.dart';
  import '../modal_classes/sales.dart';

  class PurchasesProvider extends ChangeNotifier {
    final DatabaseHelper _dbHelper = DatabaseHelper();
    final DatabaseService _databaseService = DatabaseService();

    List<Purchase> _purchases = [];

    List<Purchase> get purchases => _purchases;

    Future<void> fetchPurchases() async {
      _purchases = await _databaseService.fetchPurchase();
      notifyListeners();
    }

    Future<void> addPurchases(Purchase purchase) async {
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
  }

