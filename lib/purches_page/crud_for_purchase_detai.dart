import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/purchase_details.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';

class PurchasesDetailProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<PurchaseDetails> _purchasesDetails = [];

  List<PurchaseDetails> get purchasesDetails => _purchasesDetails;

  Future<void> fetchPurchasesDetails() async {
    _purchasesDetails = await _databaseService.fetchPurchaseDetails();
    notifyListeners();
  }

  Future<void> addPurchasesDetails(PurchaseDetails purchaseDetails) async {
    await _dbHelper.addPurchasesDetails(purchaseDetails);
    await fetchPurchasesDetails();
  }

  Future<void> updatePurchasesDetails(PurchaseDetails purchaseDetails) async {
    await _dbHelper.updatePurchasesDetails(purchaseDetails);
    await fetchPurchasesDetails();
  }

  Future<void> deletePurchasesDetails(int id) async {
    await _dbHelper.deletePurchasesDetails(id);
    await fetchPurchasesDetails();
  }
}

